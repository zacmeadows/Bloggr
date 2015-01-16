class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.all
  end 

  def create
    @blog_post = BlogPost.new blog_post_params
    @blog_post.save
    redirect_to root_path
  end
  
  def new
    @blog_post = BlogPost.new 
  end

  def edit
    @blog_post = BlogPost.find params[:id]
  end 

  def update
    @blog_post = BlogPost.find params[:id]
    if @blog_post.update blog_post_params
      redirect_to root_path
    else
      render :edit
    end 
  end 

  def destroy
    @blog_post = BlogPost.find params[:id]
    @blog_post.destroy
    redirect_to root_path
  end 

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :author)
  end

end
