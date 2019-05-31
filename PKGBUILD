# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libogg-git
pkgver=1.3.3.r19.g6ccfcc2
pkgrel=2
pkgdesc="Reference implementation of the Ogg media container"
arch=('i686' 'x86_64')
url="https://www.xiph.org/ogg/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('libogg')
conflicts=('libogg')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/ogg.git")
sha256sums=('SKIP')


pkgver() {
  cd "ogg"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ogg"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "ogg"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libogg"
}
