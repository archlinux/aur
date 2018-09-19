# Maintainer: Bruno Renié <brutasse@gmail.com>
pkgname=libivykis-git
epoch=1
pkgver=v0.42.3.trunk.r1.g8f8eb78
pkgrel=1
pkgdesc="Library for asynchronous I/O readiness notification"
url="https://github.com/buytenh/ivykis"
arch=('i686' 'x86_64')
license=('LGPL-2.1')
depends=()
makedepends=()
provides=('libivykis')
conflicts=('libivykis')
source=("git+https://github.com/buytenh/ivykis.git")
md5sums=('SKIP')

pkgver() {
	cd ivykis

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ivykis

	pushd test.mt
	aclocal
	autoheader
	libtoolize --ltdl --copy --force
	automake --add-missing --copy --foreign
	autoconf
	popd

	aclocal
	autoheader
	libtoolize --ltdl --copy --force
	automake --add-missing --copy --foreign
	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd ivykis

	make DESTDIR="$pkgdir" install
}
