# Maintainer: Dexoron <main@dexoron.tech>
pkgname=codemotion-bin
pkgver=0.0.9.4
pkgrel=1
pkgdesc="CodeMotion - IDE for web-developers (binary)"
arch=('x86_64')
url="https://github.com/cdmtn/CodeMotion"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux'
  'libsecret'
)
provides=('codemotion')
conflicts=('codemotion')
options=('!strip' '!debug')

source=(
  "codemotion-${pkgver}.tar.gz::https://github.com/cdmtn/CodeMotion/releases/download/v${pkgver}/codemotion-app-0.0.9-alpha.dev.tar.gz"
  "codemotion.desktop"
)
sha256sums=('8d22ced35388fd2b31c9e8fde786aee7c92b58c486a9d0291027f0846ce3b60c'
  '1d14cc45fad1a7018f04fb691b069edcee84ef1a0b35971c50d08514bb85ff82')

package() {
  install -dm755 "${pkgdir}/opt/codemotion"
  cp -r "${srcdir}/codemotion-app-0.0.9-alpha.dev/"* "${pkgdir}/opt/codemotion/"

  chmod 4755 "${pkgdir}/opt/codemotion/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/codemotion/codemotion-app "${pkgdir}/usr/bin/codemotion"

  install -Dm644 "${srcdir}/codemotion.desktop" "${pkgdir}/usr/share/applications/codemotion.desktop"
}
