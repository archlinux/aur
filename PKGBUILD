# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=otterly-appimage
pkgver=0.3.0
pkgrel=1
pkgdesc="Local-first, privacy-focused WYSIWYG Markdown vault with full-text search, wiki-links, and a rich editor (AppImage)"
url="https://github.com/ajkdrag/otterly"
arch=("x86_64")
depends=("fuse2")
options=("!strip")
license=("MIT")

source=("otterly-appimage-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/otterly_${pkgver}_amd64.AppImage" "otterly.png::https://raw.githubusercontent.com/ajkdrag/otterly/main/src-tauri/icons/128x128@2x.png" "otterly.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/otterly/otterly.desktop")
sha256sums=('d69efce38eb4e37d89c51110b8e0afc27100c2c4250347c7299ff03b29c76601'
            '00ada879ef2bce9a4cda5af2e1991ee0629d80633cedcc5a4192c504824263be'
            'a5511166a03249bd60b86e95277073bdd0fb9143fad9308352a4786d8dfab416')

prepare() {
  chmod +x "${srcdir}/otterly-appimage-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/otterly-appimage-${pkgver}.AppImage" "${pkgdir}/opt/otterly-appimage/otterly.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/otterly-appimage/otterly.AppImage" "${pkgdir}/usr/bin/otterly"
  install -Dm644 "${srcdir}/otterly.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/otterly.png"
  install -Dm644 "${srcdir}/otterly.desktop" "${pkgdir}/usr/share/applications/otterly.desktop"
}

