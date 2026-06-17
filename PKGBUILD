# Maintainer: czyt <czytcn@gmail.com>
pkgname=z-code-bin
pkgver=3.1.1
pkgrel=2
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
source_x86_64=("${pkgname}-amd64::https://cdn.codegeex.cn/zcode/electron/releases/${pkgver}/ZCode-${pkgver}-linux-x64.deb")
source_aarch64=("${pkgname}-arm64::https://cdn.codegeex.cn/zcode/electron/releases/${pkgver}/ZCode-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('88c695483fd6acf433f54bb77e36a8fcc4dcfd027af2173905ddc836e1d58181')
sha256sums_aarch64=('5f4bb1f920da72b2b4fc96870c6c64c11eb8cbfa9e0cc38bab0e5234970d695b')

package() {
  # Extract files from the .deb package.
  case "$CARCH" in
    x86_64)  _src="${pkgname}-amd64" ;;
    aarch64) _src="${pkgname}-arm64" ;;
  esac

  bsdtar -O -xf "${srcdir}/${_src}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Fix permissions
  chmod -R u=rwX,go=rX "${pkgdir}/opt/ZCode"
}
