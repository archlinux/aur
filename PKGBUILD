# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fspviewer
pkgver=2.1.0
pkgrel=1
pkgdesc="A standalone viewer for spherical (equirectangular) panoramic images"
arch=('x86_64')
url='http://www.fsoft.it/FSPViewer'
license=("custom:${pkgname}")
depends=('gtk2'
         'libsm'
         'libpng12')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::http://www.fsoft.it/FSPViewer/dwn-files/FSPViewer-${pkgver}-64.tar.gz"
        'fspviewer.png')
sha256sums=('3bb70c654037225c4f9b8198eb893ab5b21dbaf6b2917a17fa1792b4d5adcde6'
            'SKIP')

package() {
  install -Dm755 FSPViewer64 "${pkgdir}/usr/bin/${pkgname}"
  echo "This program is freeware: you can use it for free but the source code is not available." > LICENSE
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 fspviewer.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "FSPViewer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Graphics;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}