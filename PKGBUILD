# Maintainer: czyt <czytcn@gmail.com>
pkgname=z-code-bin
pkgver=3.17.2
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
sha256sums_x86_64=('86ec7b2a795c46ae56e7313504300a337c33c68267c28f96a03726a4f5aff575')
sha256sums_aarch64=('1f9c3d94439ab70a047e24be98297e4d31c560f5660e83c14a5997afde51c11b')

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
