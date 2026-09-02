# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=markamd-appimage
pkgver=1.7.3
pkgrel=1
pkgdesc="Local-first markdown editor with live preview, reading mode, diagrams, themes, and context bundles (AppImage)"
url="https://github.com/mattenarle10/markamd"
arch=("x86_64")
depends=("fuse2")
provides=("markamd")
conflicts=("markamd")
options=("!strip")
license=("MIT")

source=("markamd-appimage-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/marka.md_${pkgver}_amd64.AppImage" "marka.md.png::https://raw.githubusercontent.com/mattenarle10/markamd/main/src-tauri/icons/128x128@2x.png" "marka.md.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/markamd/marka.md.desktop")
sha256sums=('fcf130a30cd213cefb1c41806f087afc455a5995059243d6105ea3127cf64e1b'
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

