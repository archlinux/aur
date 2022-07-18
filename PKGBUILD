# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=mbelib-git
pkgver=1.3.0.r5.g9a04ed5
pkgrel=1
pkgdesc="P25 Phase 1 and ProVoice vocoder"
arch=('x86_64')
url="https://github.com/szechyjs/mbelib"
license=('GPL3')
makedepends=('git' 'cmake')
conflicts=('mbelib')
provides=('mbelib')
source=("$pkgname"::'git+https://github.com/szechyjs/mbelib')
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
