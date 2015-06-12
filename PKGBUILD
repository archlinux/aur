#Maintainer: xgdgsc<xgdgsc@gmail.com>
pkgname=youdao-qt-git
pkgver=20130313
pkgrel=1
pkgdesc="openyoudao dictionary client qt version"
arch=('i686' 'x86_64')
url="http://openyoudao.org/"
license=('GPL')
depends=('qt4')
#source=('https://gitcafe.com/Jactry/LinDict/zipball/master' 'lindict.desktop')
#md5sums=('eba0f685008243da4e1dfc98be7c8b25' 'e4fd210491586dc040881aea7db0610d')

_gitroot="git://github.com/lvzongting/youdao-qt.git"
_gitname="youdao-qt"

build() { 
    cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone  $_gitroot $_gitname
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package(){
  cd "$srcdir/$_gitname-build"
  qmake-qt4 
  make
  install -Dm755 youdao-qt  "$pkgdir/usr/bin/youdao-qt"
}