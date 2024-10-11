# Maintainer: Peter Jung <ptr1337@cachyos.org>

pkgname=libunicode
pkgver=0.6.0
pkgrel=1
pkgdesc="Unicode and UTF-8 C++ library"
arch=('x86_64')
url="https://github.com/contour-terminal/libunicode"
license=('Apache-2.0')
depends=(
  gcc-libs
  fmt
)
makedepends=(
  cmake
  git
  ninja
  python
  unicode-character-database
)
source=("git+https://github.com/contour-terminal/libunicode.git#tag=v$pkgver")
sha256sums=('c870c781d1b830e764c933b3601ade23eb55ae37af7900609f415950c2e08398')

build() {
  cmake -B build -S libunicode \
    -GNinja \
    -DCMAKE_BUILD_TYPE=None \
    -DLIBUNICODE_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
