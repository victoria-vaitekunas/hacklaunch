require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :form
end
#get creates a query string in the routing with all your info this is why post is the convention for forms
#post and get do the same thing but GET IS BAD PRACTICE AND NOT SECURE
#use post for forms, basically

#2 put array outside so the entire app can access it
CONTACTS = []

post '/submitted' do
	#1 whatever was submitted in the form is available in a params hash here -> see erb tags in confirm.erb
	thename = params[:name]
	theemail  = params[:email]
	CONTACTS << theemail 
	erb :confirm, locals:{fries: thename, burger: theemail}
end	

#here is a good use of get - this is not secure information
#get the page - okay - 'get' form info - not okay
#why not use post here? you can't use because it won't work because post will be expecting you to send something	
get '/about' do
	erb :aboutus
end
