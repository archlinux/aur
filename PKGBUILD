# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com
# Contributor: Uzsolt
 
pkgname=liblightstone-git
pkgver=20121116
pkgrel=2
pkgdesc="Driver for the Lightstone Biometrics USB Widget that ships with the Journey to Wild Divine video game"
url="http://liblightstone.nonpolynomial.com/"
arch=('any')
license=('custom')
install=
source=()
depends=('')
optdepends=()
conflicts=()
provides=''
makedepends=('cmake' 'libusb>=1.0')

_gitname="liblightstone"
_gitroot="git://github.com/qdot/${_gitname}.git"
 
 
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
 
  mkdir -p $srcdir/${_gitname}/build
  cd $srcdir/${_gitname}/build
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir ../ && make
}
 
package() {

    cd $srcdir/${_gitname}
    mkdir -p $pkgdir/usr/include/lightstone/
    install -m455 ./include/lightstone/lightstone.h $pkgdir/usr/include/lightstone/lightstone.h
    cd ./build
    mkdir -p $pkgdir/lib
    install -m455 ./lib/* $pkgdir/lib

    mkdir -p $pkgdir/usr/bin
    install -m755 ./bin/lightstone_test $pkgdir/usr/bin
}
