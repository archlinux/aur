# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxpm-git
pkgver=3.5.13.r2.g83e5427
pkgrel=1
pkgdesc="X pixmap (XPM) image file format library"
arch=('i686' 'x86_64')
url="https://xorg.freedesktop.org/wiki/"
license=('custom')
depends=('glibc' 'libxext' 'libxt')
makedepends=('git' 'xorg-util-macros')
provides=('libxpm')
conflicts=('libxpm')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/xorg/lib/libxpm.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxpm"

  git describe --long --tags | sed 's/^libXpm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libxpm"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "libxpm"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libxpm"
}
