# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michal Malek <michalm@jabster.pl>

pkgname=fontmatrix
pkgver=0.6.0
pkgrel=7
_commit=557e621aa1cde741c2485b04550b51fe2d51d563
pkgdesc="Font manager for Linux"
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('qtwebkit')
makedepends=('cmake' 'git' 'mesa') 
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd $pkgname
  [[ $CARCH == 'i686' ]] && _bits='32'
  [[ $CARCH == 'x86_64' ]] && _bits='64'
  export QTDIR=/usr
  export QMAKESPEC=/usr/share/qt/mkspecs/linux-g++-${_bits}
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir" install
}
