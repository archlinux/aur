# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=smartbg-git
pkgver=20100215
pkgrel=1
pkgdesc="A smart wallpaper setter for multi-head X displays"
arch=(any)
url="http://code.schnouki.net/p/smartbg/"
license=('custom:WTFPL')
depends=('pygtk')
makedepends=('git')
source=()

_gitroot="git://code.schnouki.net/smartbg.git"
_gitname="smartbg"

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

  #
  # BUILD HERE
  #

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING || return 1
  install -Dm755 smartbg $pkgdir/usr/bin/smartbg
} 
