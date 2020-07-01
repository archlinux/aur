# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=netron-bin
pkgver=4.3.6
pkgrel=1
pkgdesc="Visualizer for neural network, deep learning and machine learning models"
arch=('x86_64')
url='https://lutzroeder.github.io/netron'
license=('MIT')
provides=('netron')
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/lutzroeder/netron/releases/download/v${pkgver}/Netron-${pkgver}.AppImage"
        'LICENSE::https://github.com/lutzroeder/netron/raw/master/LICENSE')
sha256sums=('b9ab2e4b203c574226840aa8212ad194608de1b26b9e1729609997392b517cec'
            '535cb2c7c8990f967c106e3035e4df8d3e070144af1163b86c8bb58b65fe5e88')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/netron.png "${pkgdir}/usr/share/pixmaps/netron.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Netron" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Development;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.AppImage"
  ln -s /usr/share/netron/${pkgname%-bin}.AppImage "${pkgdir}/usr/bin/netron"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}