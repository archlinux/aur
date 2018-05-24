# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michal Malek <michalm@jabster.pl>

pkgname=fontmatrix
pkgver=0.6.0+174+g8108e6e
pkgrel=1
_commit=8108e6ea8b5944a92d7f27c40509b8e890ddaff1
pkgdesc="Font manager for Linux"
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('qtwebkit')
makedepends=('cmake' 'mesa') 
source=("$url/archive/$_commit.tar.gz")
sha256sums=('1fa442e5bafb08265e1078d522ca0e8a8b864ab8544fb5ce4fd77ebb2f7bfc1d')

build() {
  cd $pkgname-$_commit
  [[ $CARCH == 'i686' ]] && _bits='32'
  [[ $CARCH == 'x86_64' ]] && _bits='64'
  export QTDIR=/usr
  export QMAKESPEC=/usr/share/qt/mkspecs/linux-g++-${_bits}
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd $pkgname-$_commit/build
  make DESTDIR="$pkgdir" install
}
