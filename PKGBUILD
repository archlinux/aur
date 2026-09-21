# Maintainer: czyt <czytcn@gmail.com>
pkgname=z-code-bin
pkgver=3.14.1
pkgrel=1
pkgdesc="ZCode - AI Agents combined with existing toolchains for planning, coding, review and deployment"
arch=('x86_64' 'aarch64')
url="https://zcode.z.ai"
license=('custom')
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
optdepends=(
  'libappindicator-gtk3: for system tray icon support'
)
provides=('zcode')
conflicts=('zcode' 'zcode-bin' 'zcode-desktop-bin')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-amd64::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-x64/ZCode-${pkgver}-linux-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-arm64/ZCode-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('2ba6d9d130fdf22af500f555a2c289fa5300712dd97052231251f8782ada3fdf')
sha256sums_aarch64=('9995e1b5bd3f5786387f39cbc1c376e85dd4b001a94aa7bbc290125bac1ddf14')

package() {
  # Extract files from the .deb package.
  case "$CARCH" in
    x86_64)  _src="${pkgname}-${pkgver}-amd64" ;;
    aarch64) _src="${pkgname}-${pkgver}-arm64" ;;
  esac

  bsdtar -O -xf "${srcdir}/${_src}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Fix permissions
  chmod -R u=rwX,go=rX "${pkgdir}/opt/ZCode"
}
