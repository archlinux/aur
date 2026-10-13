# Maintainer: Sable Maintainers <https://git.sable.moe/SableClient/sable-next>

pkgname=sable-nightly-bin
# pkgver mirrors the release version with '-' replaced by '.', so each nightly
# sorts above the last. _relver keeps the original form for the asset URL.
pkgver=2.0.3.nightly.261013193756.0313dc14d980
pkgrel=1
_relver=2.0.3-nightly.261013193756.0313dc14d980
pkgdesc="A Matrix client (nightly builds)"
arch=('x86_64')
url="https://git.sable.moe/SableClient/sable-next"
license=('AGPL-3.0-or-later')
# The bundled CEF runtime needs Chromium's system libraries, not webkit2gtk.
depends=(
  'gtk3'
  'nss'
  'nspr'
  'mesa'
  'libdrm'
  'libxkbcommon'
  'alsa-lib'
  'libcups'
  'libpipewire'
  'libayatana-appindicator'
  'xdg-utils'
  'xorg-xwayland'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
provides=('sable')
conflicts=('sable' 'sable-bin')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/nightly-${_relver}/sable-${_relver}-linux-x86_64.deb")
sha256sums_x86_64=('f64ced24e4fea3a2d147984ac675d296922ee86ba43acdc1ce3ddc01edcae431')

package() {
  # bsdtar reads whichever compression nfpm used for data.tar.*
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}-x86_64.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
}
