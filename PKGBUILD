# Maintainer: Alex Murkoff <413x1nkp@gmail.com>
pkgname=paclogger
pkgver=1.3.1
pkgrel=1
pkgdesc="A Pacman hook written in C++ that logs all of the updates and downgrades every day."
arch=("x86_64")
url="https://github.com/alexlnkp/paclogger"
license=("Unlicense")
depends=("glibc"
				 "gcc-libs")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexlnkp/paclogger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e444c171533b79f0f4b5bf0e993fd384c3554c8ad8601308a5208f8191e4aa5e')

prepare() {
	tar -xvzf $pkgname-$pkgver.tar.gz
	cd $pkgname-$pkgver/
	mv * ../
	cd ..
	mkdir out
}

build() {
	cmake -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}