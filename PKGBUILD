# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vvdec
pkgver=2.0.0
pkgrel=1
pkgdesc="Fraunhofer versatile video decoder"
arch=('i686' 'x86_64')
url="https://www.hhi.fraunhofer.de/en/departments/vca/technologies-and-solutions/h266-vvc/fraunhofer-versatile-video-decoder-vvdec.html"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/fraunhoferhhi/vvdec/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55e9c2b7510ae7ecf686107e9ebf969079c05d763f822c571827e38a5e90dfeb')


build() {
  cd "$pkgname-$pkgver"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #make -C "_build" test
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/vvdec"
}
