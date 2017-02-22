# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=signal
pkgver=0.30.0
pkgrel=1
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('nwjs-bin')
makedepends=('npm' 'ruby-sass')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz")
sha512sums=('b1cd9f1010ecbb1b8f7167ee7a529657c52f5f1656c8b76425cc0dd3f6b8fa03903636114342a584b5fd50701d7b36b16890dd04293372b9502e3e0f48b3145b')

build() {
  cd "Signal-Desktop-${pkgver}"
  npm install
  node_modules/grunt-cli/bin/grunt -f
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
