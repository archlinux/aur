# Maintainer: <sulamiification at gmail dot com>, feel free to contact me there
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=frankenwm-git
_gitname="FrankenWM"
pkgver=1.0.21
pkgrel=1
pkgdesc="Fast dynamic tiling window manager based on monsterwm-xcb"
url="https://github.com/sulami/FrankenWM"
arch=('i686' 'x86_64')
license=('custom:MIT/X')
depends=('xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
source=("git+https://github.com/sulami/FrankenWM.git")
md5sums=("SKIP")

prepare() {
  cd "$srcdir/$_gitname"

  if [ -e $startdir/config.h ]; then
    msg "using custom config.h"
    cp ${startdir}/config.h .
  else
    msg "using default config.h"
  fi
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

