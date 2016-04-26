# Maintainer: codestation <codestation404@gmail.com>

pkgname=qcma
pkgver=0.3.12
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita"
arch=("i686" "x86_64")
url="https://github.com/codestation/qcma"
license=('GPL')
makedepends=('qt5-tools')
depends=('qt5-base' 'libvitamtp>=2.5.8' 'ffmpeg' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${pkgname}/archive/v${pkgver}.tar.gz" "qcma.install")
install=qcma.install
sha256sums=('3a624f4c58fa9929cc0101760db4d35acdb243687827aaee14b3d368a50cd817' '775ee63487691792e3286d592193b65e7c6b1cd319985ef1ab18f0dc80e42fb6')

prepare() {
   cd $pkgname-$pkgver
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  lrelease-qt5 common/resources/translations/*.ts
  qmake-qt5 qcma.pro PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
