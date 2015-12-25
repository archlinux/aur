pkgname=form-git
pkgver=4.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Symbolic Manipulation System developed at Nikhef."
url="https://www.nikhef.nl/~form/"
license=('GPL')
depends=('gmp>=4.2' 'zlib>=1.2')
makedepends=('git' 'autoconf>=2.59' 'automake>=1.7' 'make' 'gcc')
provides=("${pkgname%-git}")
source=("git://github.com/vermaseren/form.git")
md5sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tag | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd ${pkgname%-git}
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="$pkgdir/" install
}
