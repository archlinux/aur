# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=5.0.0
pkgrel=2
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt6-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt6-serialport' 'qt6-websockets')
makedepends=('qt6-tools' 'cmake' 'qt6-3d' 'qt6-svg')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('622cfb2b6ad108e709a665965789e0621b4b36a34698739a38aefe88eefda9b3d621f70ec0484b814cadf0b3ae735537e8b18d38807e2fb22487ad74b3558863')

prepare() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  if ! [ -e build ]; then
    mkdir build
  fi
}

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/build"
  cmake -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" -Dqmlui=ON ..
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
