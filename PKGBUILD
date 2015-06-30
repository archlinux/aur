# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=salarm-git
pkgver=20110525
pkgrel=1
pkgdesc="Scheduler written in C++, with General public license version 3 used."
url="http://salarm.seberm.com"
arch=('i686' 'x86_64')
license=('GPLv3')
install=
source=()
depends=('qt' 'phonon')
makedepends=('git')

_gitname="salarm"
_gitroot="git://git.gitorious.org/$_gitname/${_gitname}.git"


build() {

  cd ${srcdir}
  msg "Connecting to GIT ($_gitroot) ..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files of $_gitname were updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # Build 
  cd $srcdir/
  rm -rf build
  mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_gitname
  make || return 1
  make DESTDIR=${pkgdir} install || return 1 # Else return 1 - build failed
}

