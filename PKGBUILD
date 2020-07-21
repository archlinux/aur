# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=mbelib-git
pkgver=0.2.0.r1.g53b2e02
pkgrel=1
pkgdesc="Tools for decoding digital ham communication."
arch=('x86_64')
url="https://github.com/szechyjs/mbelib"
license=('GPL3')
makedepends=('git' 'cmake')
provides=('mbelib')
source=("$pkgname"::'git://github.com/szechyjs/mbelib.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	make -C build
}

check() {
	make -C build test
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
