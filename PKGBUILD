# $Id: $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: sxe <sxxe@gmx.de>

pkgname=kuickshow
pkgver=0.9.1
pkgrel=2
_kdever=4.4.0
pkgdesc="A very fast and convenient image viewer"
url="http://userbase.kde.org/KuickShow"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'imlib' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'cmake' 'automoc4')
install=${pkgname}.install
source=(http://download.kde.org/stable/${_kdever}/src/extragear/${pkgname}-${pkgver}-kde${_kdever}.tar.bz2)
md5sums=('b98453a9498e4e4142eb07dd93bd107a')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver}-kde${_kdever} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package(){
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1
}
