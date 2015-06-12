# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=regxml-git
pkgver=20110708
pkgrel=1
pkgdesc="NetBSD xmltools (git)"
arch=('i686')
url="http://git.huoc.org:13080/?p=regxml.git;a=summary"
license=('custom')
depends=('expat')

_gitroot="git://git.huoc.org/regxml.git"
_gitname="regxml.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  make
} 

package() {
  mkdir -p $pkgdir/usr/share/man/man{1,3,7}
  install -Dm755 $srcdir/$_gitname/xmlgrep/xmlgrep $pkgdir/usr/bin/xmlgrep
  install -Dm755 $srcdir/$_gitname/xmlsed/xmlsed $pkgdir/usr/bin/xmlsed
  install -Dm644 $srcdir/$_gitname/doc/*1 $pkgdir/usr/share/man/man1/
  install -Dm644 $srcdir/$_gitname/doc/*3 $pkgdir/usr/share/man/man3/
  install -Dm644 $srcdir/$_gitname/doc/*7 $pkgdir/usr/share/man/man7/
}
