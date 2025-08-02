# maintainer: bipin <kbipinkumar@pm.me>
pkgname=libdivide
pkgver=5.2.0
pkgrel=0
pkgdesc="A header-only C/C++ library for optimizing integer division."
arch=('any')
url="https://libdivide.com/"
license=('BSL-1.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ridiculousfish/libdivide/archive/refs/tags/v$pkgver.tar.gz"
        )
sha256sums=('73ae910c4cdbda823b7df2c1e0e1e7427464ebc43fc770b1a30bb598cb703f49')

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

