# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=giieditor-git
pkgver=20110830
pkgrel=1
pkgdesc="It's the official animation editor of the BlowThemAll game."
arch=('i686' 'x86_64')
url="http://code.google.com/p/blowthemall/"
license=('GPL3')
depends=('qt>=4.7.0')
makedepends=('git')
options=('strip')
source=()
md5sums=()

_gitroot="https://code.google.com/p/blowthemall.giieditor/"
_gitname="giieditor"

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

  qmake
  make
}

package() {
  cd "$pkgdir"
  mkdir -p usr/bin
  cp "$srcdir/$_gitname-build/giieditor" usr/bin
}
