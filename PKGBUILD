# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hyperkeys-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="Unleash you keyboard shorcuts"
arch=('any')
url='https://hyperkeys.xureilab.com'
license=('GPL3')
provides=('hyperkeys')
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/xurei/hyperkeys/releases/download/v${pkgver}/HyperKeys-${pkgver}.AppImage")
sha256sums=('21391eda00318d1397b14b736d10f6619af84385281a7fa10699c06ad8a016ae')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/resources/app/icon.png "${pkgdir}/usr/share/pixmaps/hyperkeys.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "HyperKeys" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.AppImage"
  ln -s /usr/share/hyperkeys/${pkgname%-bin}.AppImage "${pkgdir}/usr/bin/hyperkeys"
}