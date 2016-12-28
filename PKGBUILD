# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=signal
pkgver=0.27.0
pkgrel=2
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('nwjs-bin-0.17.3')
makedepends=('npm' 'ruby-sass')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz")
sha512sums=('b0c509578f0f3b68eaec4349a6777a79689b54469a310bd7be4a5917f9826a7f1168a4bbe45bfa50b8e1e4059ed7139588214f56497efbde91f447113c193430')

build() {
  cd "Signal-Desktop-${pkgver}"
  npm install
  node_modules/grunt-cli/bin/grunt
}

package() {
  cd "Signal-Desktop-${pkgver}/dist"
  install -Ddm755 "${pkgdir}/opt/${pkgname}"
  install -Ddm755 "${pkgdir}/usr/bin"
  #zip -r "${pkgdir}/opt/${pkgname}/signal.nw" *
  cp -r * "${pkgdir}/opt/${pkgname}/"
  echo -e "#!/bin/bash\n/usr/bin/nw /opt/signal" > "${pkgdir}/usr/bin/signal"
  chmod +x "${pkgdir}/usr/bin/signal"
}
