# $Id: PKGBUILD 269396 2016-06-12 14:49:17Z arojas $
# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Main Pkg Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
_pkgname=telepathy-qt
_pkgbase=telepathy-qt5
pkgname=$_pkgbase-git
pkgver=0.9.7.r6.gd108b58
pkgrel=1
arch=(i686 x86_64)
url="http://telepathy.freedesktop.org/wiki/"
license=(LGPL)
provides=($_pkgbase)
makedepends=(telepathy-farstream libxslt python2 cmake doxygen qt5-base)
source=(git+https://github.com/TelepathyQt/telepathy-qt.git#branch=dev)
md5sums=('SKIP')
validpgpkeys=('AA33B0D27868E36C151780F0FE0B6D736B1195ED') # Alexandr Akulich

pkgver()
{
  cd $_pkgname
  git describe --always --long | sed -E 's/telepathy-qt.//;s/([^-]*-g)/r\1/;s/-/./g;'

}


prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../telepathy-qt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DDESIRED_QT_VERSION=5 \
    -DENABLE_EXAMPLES=OFF \
    -DENABLE_TESTS=OFF
  make

}

package() {
  pkgdesc="A library for Qt5-based Telepathy clients"
  depends=(qt5-base telepathy-farstream)

  cd build
  make DESTDIR="$pkgdir" install
}
