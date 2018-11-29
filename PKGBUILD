# Maintainer: Jerome Lebleu <jerome dot lebleu at mailoo dot org>

pkgname=qlcplus
pkgver=4.12.0
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('i686' 'x86_64')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt4' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw')
# ola need to be installed at build time for the plugin to be compiled
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha256sums=('b53488e2b3f395e63c88c7132593aaeca7ccba3a2007460c4739dee4f5aa0816')

build() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  qmake-qt4 QMAKE_CXXFLAGS+=-Wno-error=unused-variable
  make
}

package() {
  cd "${srcdir}/qlcplus-QLC-_${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
}
