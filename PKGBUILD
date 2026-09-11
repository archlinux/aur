# Maintainer: Sable Maintainers <https://github.com/SableClient/Sable>

pkgname=sable-nightly-bin
# pkgver mirrors the release version with '-' replaced by '.', so each nightly
# sorts above the last. _relver keeps the original form for the asset URL.
pkgver=1.21.1.nightly.260911101317.a4540e54850e
pkgrel=1
_relver=1.21.1-nightly.260911101317.a4540e54850e
pkgdesc="An almost stable Matrix client (nightly builds)"
arch=('x86_64')
url="https://github.com/SableClient/Sable"
license=('AGPL-3.0-or-later')
# The bundled CEF runtime needs Chromium's system libraries, not webkit2gtk.
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'libcups'
  'libdrm'
  'mesa'
  'libxkbcommon'
  'libxss'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'at-spi2-core'
  'dbus'
  'libayatana-appindicator'
  'hicolor-icon-theme'
  'desktop-file-utils'
  'xdg-utils'
)
provides=('sable')
conflicts=('sable' 'sable-bin')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/nightly/Sable-${_relver}-linux-x86_64.deb")
sha256sums_x86_64=('0c21a46d023e79aa584c300f2df825abaf01c55a017b75c1ef8afa3d83058173')

package() {
  # bsdtar reads whichever compression nfpm used for data.tar.*
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
}
