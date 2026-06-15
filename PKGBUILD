# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=5.2.2
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
sha512sums=('3381269f784a867920bf0184edea2e06b74be6da35d1e95b2781dfaa40b6962cb81a28b3c8e0f3ce0de5334ae1e4311da0d93fc9ffe4feef088672a7fb1a5e16')
options=(!lto)

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/"
  #cmake -B build -W no-dev -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Dqmlui=ON -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6"
  cmake -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" -Dqmlui=ON -Wno-error=sfinae-incomplete
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  make DESTDIR="${pkgdir}" install
}
