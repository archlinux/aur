# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=blink-bin
pkgver=1.4
pkgrel=1
pkgdesc="Instant code search, source files locator. Index management for multiple projects"
arch=('x86_64')
url='https://github.com/ychclone/blink'
license=('GPL3')
provides=("${pkgname%-bin}")
options=('!strip')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/ychclone/blink/releases/download/${pkgver}/Blink-x86_64.AppImage")
sha256sums=('8587692dcb24f7087aa2f7ec7da02a6f1dd9fe80206ace0b453affb58dfe6124')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 /home/crow/Git/AUR/blink-bin/src/squashfs-root/usr/share/icons/hicolor/256x256/${pkgname%-bin}.png "${pkgdir}/usr/share/pixmaps/blink.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Blink" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Development;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}