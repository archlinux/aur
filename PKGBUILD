# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=5.1.0
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('Apache-2.0')
depends=('qt6-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt6-serialport' 'qt6-websockets')
makedepends=('qt6-tools' 'cmake' 'qt6-3d' 'qt6-svg' 'qt5-tools')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install="${pkgname}.install"
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('e743c51f5a92b0d6a83158eae4e8a9161290bede9fab3321ba4aa8f621f1651cdcfad0a744917b7762c7b38ec2ad4c729eb44931728b2a944816883c26134a98')
options=(!lto)

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}/"
  #cmake -B build -W no-dev -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Dqmlui=ON -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6"
  cmake -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" -Dqmlui=ON
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  make DESTDIR="${pkgdir}" install
}
