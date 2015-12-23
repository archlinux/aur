pkgname=form-git
pkgver=v4.1.20131025.r143.g258f42e
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="FORM is a Symbolic Manipulation System."
url="https://www.nikhef.nl/~form/"
license=('GPL')
depends=('gmp>=4.2' 'zlib>=1.2' 'openmpi')
makedepends=('git' 'autoconf>=2.59' 'automake>=1.7' 'make' 'gcc' 'doxygen>=1.3' )
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
	./configure --enable-parform --prefix=/usr
	make
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="$pkgdir/" install
}
