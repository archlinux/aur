# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=candle-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="GRBL controller application with G-Code visualizer written in Qt"
arch=('i686' 'x86_64')
url='https://github.com/Denvi/Candle'
license=('GPL3')
provides=("${pkgname%-bin}")
depends=('lib32-libsm'
         'lib32-libglvnd'
         'lib32-libxi'
         'lib32-libxrender'
         'lib32-fontconfig'
         'lib32-freetype2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/Denvi/Candle/releases/download/v1.1/Candle_${pkgver}.tar.gz")
sha256sums=('ddb098d33c8b75d98fe9d9ed9be8e4a9ce5102df8d4d6231ea62d9c9fbc6d0ff')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -avR Candle "${pkgdir}/opt/"
  ln -s /opt/Candle/Candle "${pkgdir}/usr/bin/candle"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Candle" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}