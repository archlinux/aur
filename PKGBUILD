# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Army
_pkgname=rtspeccy
pkgname=$_pkgname-git
pkgver=15.03
pkgrel=1
pkgdesc="Real time spectrum analyzer (audio)"
arch=('i686' 'x86_64')
url="http://www.uninformativ.de/projects/?q=rtspeccy"
license=('GPL3')
depends=('glut' 'alsa-lib' 'fftw' 'mesa')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git://github.com/vain/rtspeccy.git)
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
    cp config.h.example config.h
  fi
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" prefix="/usr" install
}

# vim:set ts=2 sw=2 et:
