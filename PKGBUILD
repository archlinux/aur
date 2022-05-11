## Maintainer: realasking
pkgname=essential-pathway-git
pkgver=1.0.3
pkgrel=2
pkgdesc='A tool that helps people quickly access to their most commonly used folders in command line in some operation systems like linux,written in python3.'
arch=(x86_64 i686)
url='https://github.com/realasking/essential-pathway'
license=('GPL')
depends=('python' 'env-modules' 'python-prettytable' 'python-setuptools')
provides=('essential-pathway')
source=()
md5sums=()

_proj=https://github.com/realasking/essential-pathway.git 
_name=essential-pathway 

build() {
	cd "$srcdir" 
	msg "Starting Git..."
	if [[ -d "$_proj" ]]; then
	    cd "$_proj" 
	    git pull origin
	else
	    git clone "$_proj" "$_name"
	fi
	msg "Project synchronization Finished."
	msg "Starting build..."
	
	cd "$_name"
	python setup.py build || return 1
}

package() {
	cd "$srcdir/$_name"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1 
}
