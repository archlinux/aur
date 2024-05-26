# Maintainer: Alex Murkoff <413x1nkp@gmail.com>
pkgname=paclogger
pkgver=1.2.2
pkgrel=1
pkgdesc="A Pacman hook written in C++ that logs all of the updates and downgrades every day."
arch=("x86_64")
url="https://github.com/alexlnkp/paclogger"
license=("Unlicense")
depends=("glibc"
				 "gcc-libs")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexlnkp/paclogger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2ed10431359e8d20afc4a2762a3a5e61dfb80b3ca9585078c29737e20ebfc52')

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