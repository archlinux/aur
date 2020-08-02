# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mtg-arena-tool-bin
pkgver=5.4.1
pkgrel=1
pkgdesc="An MTG Arena deck and statistics manager"
arch=('x86_64')
url='https://github.com/Manuel-777/MTG-Arena-Tool'
license=('GPL3')
provides=('mtg-arena-tool')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Manuel-777/MTG-Arena-Tool/releases/download/v${pkgver}/MTG-Arena-Tool-${pkgver}.AppImage")
sha256sums=('db07a183c78d86382e90811565dd5d10065f3101c0dbb987bcb5ddca7e1bd6bf')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/mtg-arena-tool.png "${pkgdir}/usr/share/pixmaps/mtg-arena-tool.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "MTG Arena Tool" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Game;Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/mtg-arena-tool"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}