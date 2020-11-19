# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hyperkeys-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="Unleash you keyboard shorcuts"
arch=('x86_64')
url='https://hyperkeys.xureilab.com'
license=('GPL3')
provides=('hyperkeys')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/xurei/hyperkeys/releases/download/v${pkgver}/HyperKeys-${pkgver}.AppImage")
sha256sums=('4d0a608da3393990db8b592c5645fde507c6ccade497c96530bbb5a71f69f2e6')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/resources/app/icon.png "${pkgdir}/usr/share/pixmaps/hyperkeys.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "HyperKeys" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/hyperkeys"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
