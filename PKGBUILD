# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=signal
pkgver=0.22.2
pkgrel=1
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('nwjs-bin')
makedepends=('npm' 'ruby-sass')
arch=("i686" "x86_64")
url='https://whispersystems.org'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz")
sha512sums=('de86b2472005fb04058683156015d722e3753ad4ff5b47e61b8a6c6057c63044cb1d3dd004bcc32848ec4ee0e927cc32b46f1b73d4e23cd737bd4b2fd768b241')

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
