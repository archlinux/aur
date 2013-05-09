pkgname=pycollada-git
pkgver=20130416
pkgrel=1
pkgdesc="A python COLLADA library. Can be used to create, edit and load COLLADA documents. "
arch=('any')
url="https://github.com/pycollada/pycollada"
license=("BSD3")
depends=('python-lxml' 'python-numpy' 'python-dateutil' 'python2-distribute')
makedepends=('git')

_gitroot="git://github.com/pycollada/pycollada.git"
_gitname="pycollada"

prepare() {
	 if [[ -d $_gitname ]] ; then
		  cd "$_gitname" && git pull origin
		  msg "The local files are updated."
	 else
		  git clone "$_gitroot" "$_gitname"
	 fi
}

build() {
	 cd "$_gitname"
	 python2 setup.py build
}

package() {
	 cd "$_gitname"
	 python2 setup.py install --root="$pkgdir" --optimize=1
}
