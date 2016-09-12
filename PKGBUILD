# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=signal
pkgver=0.22.1
pkgrel=1
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('nwjs-bin')
makedepends=('npm' 'ruby-sass')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz")
sha512sums=('1d012c466ad4ccaaf6ccef7b3efc6e33d004ce0a7b61579b3e52127c09fab7c0fe9075e6add249344b9388068e673560242c358b0969f7bab269fc8cef423a83')

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
