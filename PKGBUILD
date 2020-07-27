# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=condution-bin
pkgver=0.2.2.beta.1
_pkgver=0.2.2-beta.1
pkgrel=1
pkgdesc="A personal project management system that makes sense and will not burn your pockets out"
arch=('x86_64')
url='https://condution.shabang.cf'
license=('GPL3')
provides=("${pkgname%-bin}")
makedepends=('gendesk')
source=("${pkgname%-bin}-${_pkgver}.AppImage::https://github.com/Shabang-Systems/Condution/releases/download/v${_pkgver}/Condution-${_pkgver}.AppImage")
sha256sums=('dcbf050d2a7adface8e571e4e20d67720fa455047b56ad1a39e85a5841eec166')

package() {
  chmod 755 ./${pkgname%-bin}-${_pkgver}.AppImage
  ./${pkgname%-bin}-${_pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png "${pkgdir}/usr/share/pixmaps/condution.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Condution" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}