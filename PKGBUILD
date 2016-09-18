# Maintainer: János Illés <ijanos@gmail.com>
pkgname=desktend-git
pkgver=20110815
pkgrel=1
pkgdesc="automatic virtual desktop extender for X11"
arch=('i686' 'x86_64')
url="https://github.com/ijanos/desktend"
license=('GPL')
depends=('libx11')
makedepends=('git')
_gitroot='git://github.com/ijanos/desktend.git'
_gitname='desktend'

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

  cd ${srcdir}/desktend

  gcc -lX11 -std=gnu99 -o desktend -O2 desktend.c
}

package() {
  cd "$srcdir/$_gitname"
  installpath="${pkgdir}/usr/bin"
  install -D desktend $installpath/desktend
}

# vim:set ts=2 sw=2 et:
