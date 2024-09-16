# Maintainer: Peter Jung <ptr1337@cachyos.org>

pkgname=libunicode
pkgver=0.5.0
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
sha256sums=('b47188bd8078a0ed5084d6a4c1861abeb4a19ad0898852d0702e0f4ab6895451')

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
