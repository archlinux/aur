# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxi-git
pkgver=1.7.10.r0.ge05da79
pkgrel=1
pkgdesc="X11 Input extension library"
arch=('i686' 'x86_64')
url="https://www.x.org/wiki/"
license=('custom')
depends=('glibc' 'libxext' 'xorgproto')
makedepends=('git' 'libxfixes' 'xorg-util-macros')
provides=('libxi')
conflicts=('libxi')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/xorg/lib/libxi.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxi"

  git describe --long --tags | sed 's/^libXi-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libxi"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libxi"

  make check
}

package() {
  cd "libxi"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libxi"
}
