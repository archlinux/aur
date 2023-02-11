# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vvdec
pkgver=1.6.1
pkgrel=1
pkgdesc="Fraunhofer versatile video decoder"
arch=('i686' 'x86_64')
url="https://www.hhi.fraunhofer.de/en/departments/vca/technologies-and-solutions/h266-vvc/fraunhofer-versatile-video-decoder-vvdec.html"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/fraunhoferhhi/vvdec/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72de0cbcd24285e6f66209be9270f8f0c897d24e586b3876c6a7bb5691375c48')


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
