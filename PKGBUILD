# Maintainer: eddi <support@heyjunior.ai>
pkgname=junior-desktop
pkgver=2.0.33
pkgrel=1
pkgdesc="The desktop app for Junior"
arch=('x86_64')
url="https://github.com/Andrew-AI-JR/Desktop-Releases"
license=('ISC')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=(
  'libappindicator-gtk3: for system tray support'
)
options=('!strip' '!emptydirs')
_source_name="${pkgname}_${pkgver}_amd64"
source=(
  "${_source_name}.deb::https://github.com/Andrew-AI-JR/Desktop-Releases/releases/download/v${pkgver}/${_source_name}.deb"
)
sha256sums=('82b9af040cd07ae9edae708297523eecc054e8a6df15f96e56e7544962427454')

prepare() {
  bsdtar -xf "${_source_name}.deb"
}

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Junior/junior-desktop "${pkgdir}/usr/bin/${pkgname}"
  chmod 4755 "${pkgdir}/opt/Junior/chrome-sandbox"
}
