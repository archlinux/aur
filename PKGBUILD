# Maintainer: codestation <codestation404@gmail.com>

pkgname=qcma-appindicator
_pkgname=qcma
pkgver=0.3.9
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita (AppIndicator)"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
depends=('qcma>=0.3.9' 'libappindicator-gtk2')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${_pkgname}/archive/v${pkgver}.tar.gz")
install=qcma-appindicator.install
sha256sums=('46cdc03c9b1ad1ce7905dc194166291a917aee0deb38099f998914076e88c30d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # temporal patch to install icons in the correct path
  sed -i '/INCLUDEPATH/a DATADIR = $$PREFIX/share' qcma_appindicator.pro

  qmake-qt5 qcma_appindicator.pro PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
