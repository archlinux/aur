# Maintainer: David Hess <davidhess336@gmx.de>
pkgname=encounty-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Free, open-source auto shiny counter for Pokémon shiny hunting."
arch=('x86_64')
url="https://github.com/ZSleyer/Encounty"
license=('AGPL-3.0')
depends=('zlib' 'hicolor-icon-theme')
options=('!strip') # Do not strip precompiled AppImages

source=(
  "encounty-${pkgver}.AppImage::https://github.com/ZSleyer/Encounty/releases/download/v${pkgver}/Encounty-x86_64.AppImage"
  "encounty.png::https://raw.githubusercontent.com/ZSleyer/Encounty/main/backend/winres/icon.png"
  "encounty.desktop"
)

# SHA-256 for the AppImage, SKIP for the icon (raw web asset), and SKIP for local desktop file
sha256sums=(
  '3d633a1f156ccc22a077292eae4fe108479ba21bcf29514294685cf54a38befc'
  'SKIP'
  'SKIP'
)

package() {
  # 1. Install the raw AppImage into a dedicated project directory in /opt
  install -Dm755 "${srcdir}/encounty-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/encounty.AppImage"

  # 2. Create the system-wide executable directory if it doesn't exist
  mkdir -p "${pkgdir}/usr/bin"

  # 3. Create the symlink pointing from /usr/bin back to the AppImage
  ln -s "/opt/${pkgname}/encounty.AppImage" "${pkgdir}/usr/bin/encounty"

  # 4. Install the icon and desktop files as normal
  install -Dm644 "${srcdir}/encounty.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/encounty.png"
  install -Dm644 "${srcdir}/encounty.desktop" "${pkgdir}/usr/share/applications/encounty.desktop"
}
