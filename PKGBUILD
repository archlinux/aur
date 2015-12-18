# Maintainer: Jerome Lebleu <jerome dot lebleu at mailoo dot org>

pkgname=qlcplus
pkgver=4.10.2b
_pkgver=4.10.2
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
source=("http://www.qlcplus.org/downloads/${_pkgver}/qlcplus_${pkgver}.tar.gz")
md5sums=('0e6adfd8e329775a3d5482b49f935c2e')

build() {
  cd "${srcdir}/qlcplus-${_pkgver}"
  qmake-qt4 QMAKE_CXXFLAGS+=-Wno-error=unused-variable
  make
}

package() {
  cd "${srcdir}/qlcplus-${_pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
}
