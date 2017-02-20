# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michal Malek <michalm@jabster.pl>

pkgname=fontmatrix
pkgver=0.6.0
pkgrel=6
pkgdesc="Font manager for Linux"
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('qtwebkit')
makedepends=('cmake' 'git' 'mesa') 
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('fa3ca2b189115c24c628f15334e0b506298d7a16e294bcc21bde79cba9c44a84')

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
