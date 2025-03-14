# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.14.1
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt5-serialport')
makedepends=('qt5-tools' 'qt5-websockets' 'cmake' 'qt5-3d' 'qt5-svg')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('1635599f07df97ddd89f1c5a5cd510ca69c74b3d3aed5c3be2ba41eabe8968afd1eb155e35f2dcead52688ca18b9bbe98662e598a944c37c3d60d3ff4e63025d')

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
