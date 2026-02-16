# maintainer: bipin <kbipinkumar@pm.me>
pkgname=libdivide
pkgver=5.3.0
pkgrel=1
pkgdesc="A header-only C/C++ library for optimizing integer division."
arch=('any')
url="https://libdivide.com/"
license=('BSL-1.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ridiculousfish/libdivide/archive/refs/tags/v$pkgver.tar.gz"
        )
sha256sums=('de3933bf2fd21300d99fcc6460a8a4a1343ae90b965d6893f044c350bac68c6e')

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None  \
    -Wno-dev \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -DLIBDIVIDE_BUILD_TESTS=OFF

   MAKEFLAGS=-j1 cmake --build build

}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}

