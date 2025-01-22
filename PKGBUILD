# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.14.0
pkgrel=2
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt5-serialport')
makedepends=('qt5-tools' 'qt5-websockets')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('08968bd600a71b15f77f596fd1fa0f27b6796782fdb828d1fcfd0d6b2d570327392adf706f6255bc4bf51de8559ec43a7e11c9829faa91b4387bc28d097a3d5f')

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
