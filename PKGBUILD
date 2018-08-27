# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=yasm-git
pkgver=1.3.0.r36.ge256985c
pkgrel=1
pkgdesc="A complete rewrite of the NASM assembler under the BSD License"
arch=('i686' 'x86_64')
url="https://yasm.tortall.net/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('yasm')
conflicts=('yasm')
source=("git+https://github.com/yasm/yasm.git")
sha256sums=('SKIP')


pkgver() {
  cd "yasm"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "yasm"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "yasm"

  #make check
}

package() {
  cd "yasm"

  make DESTDIR="$pkgdir" install

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/yasm/COPYING"
  install -Dm644 "BSD.txt" "$pkgdir/usr/share/licenses/yasm/BSD.txt"
}
