# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.12.4
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('i686' 'x86_64' 'armv7h')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw' 'libftdi' 'desktop-file-utils')
makedepends=('qt5-tools')
optdepends=('ola: Open Lighting Architecture plugin')
conflicts=('qlc' 'qlc-svn')
install=${pkgname}.install
source=("https://github.com/mcallegari/qlcplus/archive/QLC+_${pkgver}.tar.gz")
sha512sums=('19893c5f29602e2e65db9eb162c3f45ce3f028424ecf17d7615f9d3ada8a871dd1a1827ea9a243d7bd0f23ba7e9fb2340531154ac557d5756f0aa05648c56b13')

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
