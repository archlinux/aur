# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cmark-git
pkgver=0.29.0.r104.g8410d2c
pkgrel=1
pkgdesc="CommonMark parsing and rendering library"
arch=('i686' 'x86_64')
url="https://github.com/commonmark/cmark"
license=('BSD' 'custom')
depends=('glibc')
makedepends=('git' 'cmake' 'python')
provides=('cmark')
conflicts=('cmark')
options=('staticlibs')
source=("git+https://github.com/commonmark/cmark.git")
sha256sums=('SKIP')


pkgver() {
  cd "cmark"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cmark"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "cmark"

  make -C "_build" test
}

package() {
  cd "cmark"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/cmark"
}
