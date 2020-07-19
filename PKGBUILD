# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=architect
pkgver=0.9.11
_pkgver=20170518095416
pkgrel=1
pkgdesc="An integrated development environment (IDE) that focuses specifically on the needs of the data scientist"
arch=('x86_64')
url='https://www.getarchitect.io'
license=('EPL')
depends=('r'
         'r-rjava'
         'freetype2'
         'curl'
         'python'
         'libjpeg-turbo'
         'libxtst'
         'tk'
         'libnet'
         'java-runtime'
         'libxmu'
         'cairo'
         'alsa-lib'
         'libtiff')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://www.getarchitect.io/downloads/architect-stable_${_pkgver}_amd64.deb"
        'architect.png')
sha256sums=('8100cab2828eda5f895ed8ea65267b2b3920d39a996a6d8f8436e3258959e7e8'
            'SKIP')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod o-w {} +
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod o-w {} +
  chmod 755 "${pkgdir}/opt/${pkgname}/stable/${_pkgver}/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/stable/${_pkgver}/${pkgname} "${pkgdir}/usr/bin/architect"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Architect" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 architect.png -t "${pkgdir}/usr/share/pixmaps"
}