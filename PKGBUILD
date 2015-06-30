# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=ttyqr-git
pkgver=20120217
pkgrel=1
pkgdesc="draw QR codes straight into the terminal"
url="https://github.com/oskar456/ttyqr"
arch=('i686' 'x86_64')
license=('GPLv3')
install=
source=()
depends=('qrencode')
makedepends=('git')

_gitname="ttyqr"
_gitroot="git://github.com/oskar456/${_gitname}.git"


build() {
  cd $srcdir
  msg "Connecting to GIT (${_gitroot}) ..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done or server timeout"

  cd ${srcdir}/$_gitname
  make && install -Dm755 $_gitname ${pkgdir}/usr/bin/${_gitname}
 
}
