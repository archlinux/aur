# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.13.0
pkgrel=2
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils' 'qt5-serialport')
makedepends=('qt5-tools')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('0ec7fda23819c6bcf1132edc877cde22db3daa954a6043bf7a142af0e3670f5fbe4be1678c638996994833a8969dcf21698b1bec573973b80090c6f8b3610816')

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  ./translate.sh ui
  qmake-qt5 QMAKE_CXXFLAGS=-Wno-deprecated-declarations
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
}
