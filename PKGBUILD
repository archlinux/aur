# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pe-parse
pkgver=2.1.1
pkgrel=2
pkgdesc="Principled, lightweight C/C++ PE parser"
arch=('i686' 'x86_64')
url="https://github.com/trailofbits/pe-parse"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trailofbits/pe-parse/archive/refs/tags/v2.1.1.tar.gz")
sha256sums=('74c4012274e6e15128a8cf4453f63bb11155bcc14ad56ca7594a259ae8ae0202')


prepare() {
  cd "$pkgname-$pkgver"

  sed -i -e 's|-Werror||g' "cmake/compilation_flags.cmake"
}

build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/pe-parse"
}
