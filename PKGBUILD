# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=magiccap-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="An open-source, versatile image/GIF capture suite for Mac and Linux"
arch=('x86_64')
url='https://magiccap.me'
license=('MPL2')
depends=('nodejs'
         'libwebp'
         'libjpeg-turbo'
         'libxss'
         'libcroco'
         'libgsf'
         'gtk3'
         'nss'
         'python2'
         'libexif'
         'orc')
makedepends=('unzip' 'gendesk')
noextract=("${pkgname}-${pkgver}.zip")
source=("${pkgname}-${pkgver}.zip::https://github.com/MagicCap/MagicCap/releases/download/v${pkgver}/magiccap-linux.zip")
sha256sums=('969d4fc8cf8086000371c6190e0423ed5765427bf6d9de74c45ca88705c2a68a')

package() {
  install -d "${pkgdir}/opt/magiccap/" "${pkgdir}/usr/bin"
  unzip ${pkgname}-${pkgver}.zip -d "${pkgdir}/opt/magiccap/"
  ln -sf /opt/magiccap/MagicCap "${pkgdir}/usr/bin/magiccap"
  install -Dm644 "${pkgdir}/opt/magiccap/resources/app/dist/icons/magiccap.png" \
    "${pkgdir}/usr/share/pixmaps/magiccap.png"
  install -Dm644 "${pkgdir}/opt/magiccap/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "MagicCap" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Graphics;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}".desktop -t "${pkgdir}/usr/share/applications"
}