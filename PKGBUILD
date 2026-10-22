# Maintainer: Sable Maintainers <https://git.sable.moe/SableClient/sable-next>

pkgname=sable-nightly-bin
# pkgver mirrors the release version with '-' replaced by '.', so each nightly
# sorts above the last. _relver keeps the original form for the asset URL.
pkgver=2.1.5.nightly.261022103835.ad91058e4375
pkgrel=1
_relver=2.1.5-nightly.261022103835.ad91058e4375
pkgdesc="A Matrix client (nightly builds)"
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
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/nightly-${_relver}/sable-${_relver}-amd64.deb")
sha256sums_x86_64=('4d6e58efdb8aaeee3740ea86a28b631fda92bd6da7eb0ab1103e3e5d094741be')

package() {
  # bsdtar reads whichever compression the deb uses for data.tar.*
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}-amd64.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt" -name chrome-sandbox -exec chmod 4755 {} +
}
