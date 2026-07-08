# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=libxdf
pkgver=1.0.2
pkgrel=1
pkgdesc="A C++ library for loading XDF files"
arch=('x86_64')
url="https://github.com/xdf-modules/libxdf"
license=('GPL')
makedepends=('cmake')
options=(staticlibs)
source=(https://github.com/xdf-modules/libxdf/archive/v$pkgver.zip)
sha256sums=('f34a3c9c3049fc42c0aaf71efbd3897018ab2e7cfdb9993406c13c4539f2ac08')

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
