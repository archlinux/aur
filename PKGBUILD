# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hdrhistogram_c
pkgver=0.11.7
pkgrel=1
pkgdesc="C port of the HdrHistogram"
arch=('i686' 'x86_64')
url="https://hdrhistogram.github.io/HdrHistogram/"
license=('BSD' 'custom:CC0')
depends=('glibc' 'zlib')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/HdrHistogram/HdrHistogram_c/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b7792916274fe47c0f3fe93721c4c607bf842ffa954201eef750631a036144fb')


build() {
  cd "HdrHistogram_c-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "HdrHistogram_c-$pkgver"

  make -C "_build" test
}

package() {
  cd "HdrHistogram_c-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 {COPYING,LICENSE}.txt -t "$pkgdir/usr/share/licenses/hdrhistogram_c"
}
