# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=electorrent-bin
pkgver=2.7.3
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
sha256sums=('6d0c6e1c0023a4f99fb2af646108b2af2b037f3ddd9fd962c9a7f15a14585ab5')

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
