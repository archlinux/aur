# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=5.3.0
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('Apache-2.0')
depends=('qt6-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt6-serialport' 'qt6-websockets' 'qt6-svg' 'qt6-3d')
makedepends=('qt6-tools' 'cmake' 'qt5-tools')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install="${pkgname}.install"
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('7de7e9289363f0f35f2991ecead13d2081f88bca4093409f0712fdc46a969a89ea3dc2f6951e754dc6fbbede1126d18d5c1fec570734511eb3cb1b7b4f9940e5')
options=(!lto)

prepare() {
  cd "${srcdir}/${pkgname}-QLC-_${pkgver}"
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-QLC-_${pkgver}"
  export CXXFLAGS+=" -Wno-error=sfinae-incomplete"
  export CMAKE_BUILD_TYPE="Release"

  cmake -B build \
    -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dqmlui=ON
  make -C build
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  make DESTDIR="${pkgdir}" -C build install
}
