# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxext-git
pkgver=1.3.4.r1.g4790406
pkgrel=1
pkgdesc="X11 common extensions library"
arch=('i686' 'x86_64')
url="https://www.x.org/wiki/"
license=('custom')
depends=('glibc' 'libx11' 'xorgproto')
makedepends=('git' 'xorg-util-macros')
provides=('libxext')
conflicts=('libxext')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/xorg/lib/libxext.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxext"

  git describe --long --tags | sed 's/^libXext-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libxext"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libxext"

  make check
}

package() {
  cd "libxext"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libxext"
}
