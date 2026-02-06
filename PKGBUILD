# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=5.2.0
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
sha512sums=('44bdd41219a4a8f1f281e1634f735150982697c2eee80d25ba9b5ce35a440871273410088a64275c181a70ef92f5c9a69e980d7fbe6a174923aae42fe7917d1a')
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
