# Maintainer: Sable Maintainers <https://git.sable.moe/SableClient/sable-next>

pkgname=sable-nightly-bin
# pkgver mirrors the release version with '-' replaced by '.', so each nightly
# sorts above the last. _relver keeps the original form for the asset URL.
pkgver=1.22.10.nightly.261005092911.757538b5b87a
pkgrel=1
_relver=1.22.10-nightly.261005092911.757538b5b87a
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/nightly-${_relver}/sable-next-${_relver}-linux-x86_64.deb")
sha256sums_x86_64=('3e814ae66b7a9e7c7b1b9db1414713931e7f3fbf5ccbb3f0d087866024918497')

package() {
  # bsdtar reads whichever compression nfpm used for data.tar.*
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}-x86_64.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
}
