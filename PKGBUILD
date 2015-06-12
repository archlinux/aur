# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=mqrg-git
pkgver=20140617
pkgrel=2
pkgdesc="microqrcode generator draws QR codes into the text terminal"
url="https://github.com/trezor/microqrcode"
arch=('i686' 'x86_64')
license=('MIT')
source=()
depends=('glibc')
makedepends=('git' 'check')

_gitname="microqrcode"
_gitroot="git://github.com/trezor/${_gitname}.git"


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
  make
}

package() {
  cd ${srcdir}/$_gitname
  install -Dm755 ./test ${pkgdir}/usr/bin/${_gitname}
}
