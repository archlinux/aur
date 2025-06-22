# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.14.2
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt5-serialport' 'qt5-websockets')
makedepends=('qt5-tools' 'cmake' 'qt5-3d' 'qt5-svg')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('1d551cf03262d537d9557e6cde3ef9f800b395626024c1615c6a8beba6f583f7786fd7547216b6884652b9dee2e056b1daaed2ad1a2a875c77a0455b5c5148d3')

prepare() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  if ! [ -e build ]; then
    mkdir build
  fi
}

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/build"
  cmake -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt5" ..
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
