# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=wifigw
pkgver=20120909
pkgrel=1
pkgdesc="Login to VUT wifi network"
url="https://github.com/seberm/wifigw"
arch=('any')
license=('GPLv3')
install=
source=()
depends=('bash' 'curl')
provides=''
makedepends=('git')

_gitname="$pkgname"
_gitroot="git://github.com/seberm/${pkgname}.git"


build() {
  cd $srcdir
  msg "Connecting to GIT (${_gitroot}) ..."

  if [ -d "$_gitname" ]; then
    cd "$_gitname" && git pull origin
    msg "The local files of ${_gitname} were updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  msg "GIT checkout done or server timeout"

  install -D -m755 "$srcdir/$_gitname/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}
