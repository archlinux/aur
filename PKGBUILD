# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=markamd-appimage
pkgver=1.7.2
pkgrel=1
pkgdesc="Local-first markdown editor with live preview, reading mode, diagrams, themes, and context bundles (AppImage)"
url="https://github.com/mattenarle10/markamd"
arch=("x86_64")
depends=("fuse2")
options=("!strip")
license=("MIT")

source=("markamd-appimage-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/marka.md_${pkgver}_amd64.AppImage" "marka.md.png::https://raw.githubusercontent.com/mattenarle10/markamd/main/src-tauri/icons/128x128@2x.png" "marka.md.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/markamd/marka.md.desktop")
sha256sums=('a4cefcd7d40bc04281e0060175f6fe81b3f6f55359bd02e1bc2ba230f7455226'
            '5e678fe988a763a6bdf8ac50ec38db2f542dd4e99eb5d157af496d531cb51b39'
            '58f6fa06e28241c76c45286ff235edc7abd98cc22d3e380e088213c3329ccfff')

prepare() {
  chmod +x "${srcdir}/markamd-appimage-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/markamd-appimage-${pkgver}.AppImage" "${pkgdir}/opt/markamd-appimage/marka.md.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/markamd-appimage/marka.md.AppImage" "${pkgdir}/usr/bin/marka.md"
  install -Dm644 "${srcdir}/marka.md.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/marka.md.png"
  install -Dm644 "${srcdir}/marka.md.desktop" "${pkgdir}/usr/share/applications/marka.md.desktop"
}

