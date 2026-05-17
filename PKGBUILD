# Maintainer: ParisSyc

pkgname=termius-bin
_pkgname=termius-app
pkgver=9.38.2
pkgrel=1
pkgdesc='Modern SSH client for Mac, Windows, Linux, iOS and Android'
arch=('x86_64')
url='https://termius.com/'
license=('MIT' 'BSD-3-Clause' 'LicenseRef-Termius')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: tray indicator support'
)
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.deb::https://download.termius.com/linux/Termius.deb")
sha256sums=('a57994b6406131de78276beb62f9bbe50d6ea7cd8df533ee9e677d5f656e5295')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  rm -rf "${pkgdir}/etc"

  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/Termius/termius-app' "${pkgdir}/usr/bin/termius"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s '/opt/Termius/LICENSE.electron.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s '/opt/Termius/LICENSES.chromium.html' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
