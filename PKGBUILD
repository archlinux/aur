# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hdrhistogram_c
pkgver=0.11.9
pkgrel=1
pkgdesc="C port of the HdrHistogram"
arch=('i686' 'x86_64')
url="https://hdrhistogram.github.io/HdrHistogram/"
license=('BSD-2-Clause' 'CC0-1.0')
depends=('glibc' 'zlib')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/HdrHistogram/HdrHistogram_c/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0eb5fdb9f1f8c4b9c6eb319502f8d9e28991afffb8418672a61741993855650e')


build() {
  cd "HdrHistogram_c-$pkgver"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "HdrHistogram_c-$pkgver"

  #cmake --build "_build" --target test
}

package() {
  cd "HdrHistogram_c-$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 {COPYING,LICENSE}.txt -t "$pkgdir/usr/share/licenses/hdrhistogram_c"
}
