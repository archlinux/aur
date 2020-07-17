# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=simplest-file-renamer-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Rename your files quickly and easily"
arch=('x86_64')
url='https://github.com/whyboris/Simplest-File-Renamer'
license=('MIT')
provides=('simplest-file-renamer')
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/whyboris/Simplest-File-Renamer/releases/download/v${pkgver}/Simplest.File.Renamer-${pkgver}.AppImage"
        'LICENSE::https://github.com/whyboris/Simplest-File-Renamer/raw/main/LICENSE')
sha256sums=('ee8d258a22da54055a6fb851884664ecbe4ca01234e6e81faf61eb9b2ba3c044'
            '52debcb7a9763131668b36c7a61730979cb67975b8b4004a12c62915221e836f')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/simplest-file-renamer.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Simplest File Renamer" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}