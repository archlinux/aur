# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=ledmon
pkgver=20110126
pkgrel=1
pkgdesc="Monitor your keyboard LED [C] (unmaintained)"
arch=('i686' 'x86_64')
url="http://github.com/jgoerzen/ledmon"
license=('GPL')
depends=('libx11')
makedepends=('git')

_gitroot="https://github.com/jgoerzen/ledmon.git"
_gitname="ledmon"

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
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d "$pkgdir/usr/bin/"
  cp ledmon "$pkgdir/usr/bin/"
} 
