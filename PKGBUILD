# Maintainer: Alex Murkoff <413x1nkp@gmail.com>
pkgname=paclogger
pkgver=1.3.1
pkgrel=3
pkgdesc="A Pacman hook written in C++ that logs all of the updates and downgrades every day."
arch=("x86_64")
url="https://codeberg.org/413x1nkp/paclogger"
license=("Unlicense")
depends=(
	"glibc"
	"gcc-libs"
)
makedepends=(
	"cmake"
	"ctre"
)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/413x1nkp/paclogger/archive/v$pkgver.tar.gz")
sha256sums=('a2aa360ea818e41ff35fc9979284c23d90d093dd7ef57e9a6102f2eb212c03db')

prepare() {
	tar -xvzf $pkgname-$pkgver.tar.gz
	cd $pkgname/
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
