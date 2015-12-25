pkgname=form-git
_pkgnamebase=${pkgname%-git}
pkgver=v4.1.20131025.r143.g258f42e
pkgrel=1
pkgdesc="Symbolic Manipulation System developed at Nikhef."
arch=('i686' 'x86_64')
url="https://www.nikhef.nl/~form/"
license=('GPL')
depends=('gmp>=4.2' 'zlib>=1.2')
makedepends=('git' 'autoconf>=2.59' 'automake>=1.7' 'make' 'gcc')
provides=$_pkgnamebase
source=("git://github.com/vermaseren/form.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgnamebase
	git describe --long --tag | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	_ncores=$(($(lscpu -p=core | tail -n 1)+1))
	cd $_pkgnamebase
	autoreconf -i
	./configure --prefix=/usr
	make -j$_ncores
}

package() {
	cd $_pkgnamebase
	make DESTDIR="$pkgdir/" install
}
