#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michal Malek <michalm@jabster.pl>

pkgname=fontmatrix
pkgver=0.6.0
pkgrel=6
pkgdesc="Font manager for Linux"
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
_git=557e621aa1cde741c2485b04550b51fe2d51d563
license=('GPL')
depends=('qtwebkit')
makedepends=('cmake' 'git' 'mesa') 
source=($pkgname::$url/archive/$_git.tar.gz)
sha256sums=('2c5f4eb9b6d2a7ae32f1918a9bc157d2f9c21bc4aa6dfc1e80025f98c9a24b34')

build() {
  cd $pkgname-$_git
  [[ $CARCH == 'i686' ]] && _bits='32'
  [[ $CARCH == 'x86_64' ]] && _bits='64'
  export QTDIR=/usr
  export QMAKESPEC=/usr/share/qt/mkspecs/linux-g++-${_bits}
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd $pkgname-$_git/build
  make DESTDIR="$pkgdir" install
}
