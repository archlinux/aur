# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=xiate
pkgname=$_pkgname-git
pkgver=18.05.3.g4a53068
pkgrel=1
pkgdesc="xiate is a terminal emulator"
arch=('i686' 'x86_64')
url="https://uninformativ.de/git/xiate"
license=('MIT')
depends=('vte3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://uninformativ.de/git/xiate.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

prepare() {
  cd "$srcdir/$_pkgname"

  # custom config
  echo "$SRCDEST"
  if [ -e "$SRCDEST"/config.h ]
  then
    msg "Using custom config.h"
    cp "$SRCDEST"/config.h .
  else
    cp config.def.h config.h
  fi
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
