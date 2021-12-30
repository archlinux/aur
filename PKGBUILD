# Maintainer: SanskritFritz (gmail)
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michal Malek <michalm@jabster.pl>

pkgname=fontmatrix
pkgver=0.9.100
pkgrel=2
pkgdesc="Font manager for Linux"
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('qt5-webkit')
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('241021e24b0e2cdbc4bdf516d41ddfd23675a5a098bdaa0f7564d866cd292659')

build() {
  cd $pkgname-$pkgver
  [[ $CARCH == 'i686' ]] && _bits='32'
  [[ $CARCH == 'x86_64' ]] && _bits='64'
  export QTDIR=/usr
  export QMAKESPEC=/usr/share/qt/mkspecs/linux-g++-${_bits}
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
