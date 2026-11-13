# Maintainer: czyt <czytcn@gmail.com>
pkgname=z-code-bin
pkgver=3.18.2
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
sha256sums_x86_64=('a7e066eeb018d15e403546a14dd3692220fc9976769b1f3525a0620cfa974f73')
sha256sums_aarch64=('be3de63f57b1351d921bd977a21cff212d9e5a0710e3af8eae8abcfc2147b714')

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
