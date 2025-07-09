# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cmark-git
pkgver=0.31.1.r13.g3460cd80
pkgrel=1
pkgdesc="CommonMark parsing and rendering library"
arch=('i686' 'x86_64')
url="https://github.com/commonmark/cmark"
license=('BSD-2-Clause' 'LicenseRef-cmark')
depends=('glibc')
makedepends=('git' 'cmake' 'python')
provides=("cmark=$pkgver")
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
  cmake --build "_build"
}

check() {
  cd "cmark"

  #cmake --build "_build" --target test
}

package() {
  cd "cmark"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/cmark"
}
