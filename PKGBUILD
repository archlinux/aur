# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=qlcplus
pkgver=4.12.6
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
sha512sums=('80869bc0c1682aeb81f5463253be595aa4745d3c4b5e20a1c8ae1c3d9ceabbbf251b52bebb723d9e0297bc712cc75fe2dd472182b79bef84b351cd4795231765')

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
