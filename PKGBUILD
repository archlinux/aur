# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vvdec
pkgver=3.0.0
pkgrel=1
pkgdesc="Fraunhofer versatile video decoder"
arch=('i686' 'x86_64')
url="https://www.hhi.fraunhofer.de/en/departments/vca/technologies-and-solutions/h266-vvc/fraunhofer-versatile-video-decoder-vvdec.html"
license=('BSD-3-Clause-Clear')
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/fraunhoferhhi/vvdec/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('090688c2f9beebd4e8a2ec197a5b9429803498cd3c91fbec62fe7718a8268114')


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
  cmake --build "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #cmake --build "_build" --target test
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/vvdec"
}
