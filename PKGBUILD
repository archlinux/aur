# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=libfreesrp-git
pkgver=0.3.0.r0.g541e7bb
pkgrel=1
pkgdesc="Small C++ library to interface with the FreeSRP"
arch=('i686' 'x86_64')
url="https://github.com/myriadrf/libfreesrp"
license=('GPL')
depends=('git')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/myriadrf/libfreesrp")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname}

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p "$srcdir/$pkgname/build"
	cd build
	cmake ../ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_VERBOSE_MAKEFILE=ON
	make
}

package() {
	cd "$srcdir/$pkgname/build"

	make DESTDIR="${pkgdir}" install
}
