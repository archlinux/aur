# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=electorrent-bin
pkgver=2.7.2
pkgrel=1
pkgdesc="A remote control client for µTorrent, qBittorrent, rTorrent, Transmission, Synology & Deluge"
arch=('x86_64')
url='https://github.com/Tympanix/Electorrent'
license=('GPL3')
provides=('electorrent')
conflicts=('electorrent')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/tympanix/Electorrent/releases/download/v${pkgver}/Electorrent-${pkgver}.AppImage")
sha256sums=('64eba9cf187a7924ec1c6585a595fccd2fd1260633980e83c371354a5d2a3283')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/electorrent.png "${pkgdir}/usr/share/pixmaps/electorrent.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Electorrent" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Network;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/electorrent"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
