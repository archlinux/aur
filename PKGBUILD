# Maintainer: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>
pkgname=fgdata-git
pkgver=20150613
pkgrel=1
pkgdesc="Base-Data for the opensource flight-simulator."
arch=('i686' 'x86_64')
url="http://www.flightgear.org"
license=('GPL')
depends=('')
makedepends=('git')
provides=('fgdata-git')
conflicts=('flightgear-data')
source=()
md5sums=()

_gitroot="git://git.code.sf.net/p/flightgear/fgdata"
_gitname="fgdata"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package(){
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/share/flightgear
  mv * $pkgdir/usr/share/flightgear || return 1
  chown root.users $pkgdir/usr/share/flightgear/
} 

