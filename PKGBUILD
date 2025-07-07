# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.14.3
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
sha512sums=('c379596197f6e7b7e7955dd718bb62af3511c7c856bd5967c44417785de2345f78f1bf0a65ed70ee0c8a084fa80471721e2ac6ebb00631ba6fedaa6ab4e140de')

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
