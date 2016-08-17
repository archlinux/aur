# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=signal
pkgver=0.19.0
pkgrel=1
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('nwjs-bin')
makedepends=('npm' 'ruby-sass')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz")
sha512sums=('aacc921fa27f52737da6b81c05dee2990432eadfd10da4a1a5f9f39db79a8cdd96edd29da0e986340fd6a803ac96e233dde0f10c45184a14bf950439a9e9b1d8')

build() {
  cd "Signal-Desktop-${pkgver}"
  npm install
  node_modules/grunt-cli/bin/grunt
}

package() {
  cd "Signal-Desktop-${pkgver}/dist"
  install -Ddm755 "${pkgdir}/opt/${pkgname}"
  install -Ddm755 "${pkgdir}/usr/bin"
  zip -r "${pkgdir}/opt/${pkgname}/signal.nw" *
  echo -e "#!/bin/bash\n/usr/bin/nw /opt/signal/signal.nw" > "${pkgdir}/usr/bin/signal"
  chmod +x "${pkgdir}/usr/bin/signal"
}
