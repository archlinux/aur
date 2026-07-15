# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libxdf
pkgver=1.0.3
pkgrel=1
pkgdesc="A C++ library for loading XDF files"
arch=('x86_64')
url="https://github.com/xdf-modules/libxdf"
license=('GPL')
makedepends=('cmake')
options=(staticlibs)
source=(https://github.com/xdf-modules/libxdf/archive/v$pkgver.zip)
sha256sums=('4414de1315ee36d9fc898076f8a4fd7638f07b1d958fb5c7ecb8da6844137ee3')

build() {
  cd "$srcdir/libxdf-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
  cmake -B build_shared -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
  cmake --build build_shared
}

package() {
  cd "$srcdir/libxdf-$pkgver"
  install -Dm644 xdf.h "$pkgdir/usr/include/xdf.h"
  install -Dm644 build/libxdf.a "$pkgdir/usr/lib/libxdf.a"
  install -Dm755 build_shared/libxdf.so "$pkgdir/usr/lib/libxdf.so"
}
