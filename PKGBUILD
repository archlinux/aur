# Maintainer: Sable Maintainers <https://git.sable.moe/SableClient/sable-next>

pkgname=sable-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="A Matrix client"
arch=('x86_64')
url="https://git.sable.moe/SableClient/sable-next"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'nss'
  'libnotify'
  'libxss'
  'libxtst'
  'at-spi2-core'
  'util-linux-libs'
  'xdg-utils'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
provides=('sable')
conflicts=('sable' 'sable-nightly-bin')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/sable-electron-${pkgver}-amd64.deb")
sha256sums_x86_64=('0e39505590569326fe7db43eef874e45892439b0b9a3e5598d46c3e5e551945e')

package() {
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}-amd64.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt" -name chrome-sandbox -exec chmod 4755 {} +
}
