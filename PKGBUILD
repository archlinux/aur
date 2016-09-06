# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Felix Yan <felixonmars at archlinux dot org>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: trya <tryagainprod at gmail dot com>

pkgname=quazip-qt4
_pkgname=quazip
pkgver=0.7.2
pkgrel=1
pkgdesc="C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package, qt4 version"
url="http://sourceforge.net/projects/quazip/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=(qt4)
makedepends=(cmake)
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('84163487a4c3470781c93e5f56c4ca43')

prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build
  cmake "../${_pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_QT4:BOOL=ON -DCMAKE_CXX_FLAGS="${CFLAGS} -fPIC"
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
