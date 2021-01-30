# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=yasm-git
pkgver=1.3.0.r48.g009450c7
pkgrel=2
pkgdesc="A complete rewrite of the NASM assembler under the BSD License"
arch=('i686' 'x86_64')
url="https://yasm.tortall.net/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'python')
provides=('yasm')
conflicts=('yasm')
options=('staticlibs')
source=("git+https://github.com/yasm/yasm.git")
sha256sums=('SKIP')


pkgver() {
  cd "yasm"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "yasm"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=OFF \
    ./
  make -C "_build"
}

check() {
  cd "yasm"

  #make -C "_build" test
}

package() {
  cd "yasm"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 {BSD.txt,COPYING} -t "$pkgdir/usr/share/licenses/yasm"
}
