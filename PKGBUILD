# Maintainer: Peter Jung <ptr1337@cachyos.org>

pkgname=libunicode
pkgver=0.4.0
pkgrel=2
pkgdesc="Unicode and UTF-8 C++ library"
arch=('x86_64')
url="https://github.com/contour-terminal/libunicode"
license=('Apache-2.0')
depends=(
  gcc-libs
)
makedepends=(
  cmake
  git
  ninja
  python
  unicode-character-database
)
source=("git+https://github.com/contour-terminal/libunicode.git#tag=v$pkgver")
sha256sums=('f8d195d08a471d43d3b254e5879a38eb502f310a36e7f3b1b82db1f51949d5e5')

prepare() {
	cd "$pkgname"
}

build() {
  cmake -B build -S libunicode \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIBUNICODE_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
