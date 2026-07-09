# Maintainer: czyt <czytcn@gmail.com>
pkgname=z-code-bin
pkgver=3.3.3
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
source_x86_64=("${pkgname}-${pkgver}-amd64::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/ZCode-${pkgver}-linux-x64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/ZCode-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('286d65d50edd58cc9fda74d7794b6884a467a393caacdb2403f596e80f45c7ab')
sha256sums_aarch64=('f76780677c443f5160003e46f2673b3f65d7635225e598520a770284567534df')

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
