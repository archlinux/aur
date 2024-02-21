# Maintainer: Diptesh Choudhuri <ignisda2001@gmail.com>

pkgname=devpod
pkgver=0.5.3
pkgrel=1
pkgdesc="Codespaces but open-source, client-only, and unopinionated - unofficial package"
arch=('x86_64')
url="https://github.com/loft-sh/devpod"
license=('MPL-2.0')
depends=('fuse2')
options=('!strip')
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/loft-sh/devpod/releases/download/v${pkgver}/DevPod_linux_amd64.AppImage"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
  "devpod.png::${url}/raw/v${pkgver}/desktop/devpod.png"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir"

  chmod +x "${pkgname}-${pkgver}.AppImage"

  install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "devpod.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  mkdir -p "${pkgdir}/usr/share/applications/"

  echo "[Desktop Entry]
Type=Application
Name=Devpod
Exec=/opt/${pkgname}/${pkgname}.AppImage
Icon=${pkgname}
Comment=Codespaces but open-source, client-only, and unopinionated - unofficial package
Terminal=false
Categories=Development;" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
