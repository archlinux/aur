# Maintainer: Jonas Nydahl <nydahl98 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=moonpanoramamaker
pkgver=1.0.1
pkgrel=1
pkgdesc="Automatic telescope and camera control for moon panorama photography"
arch=('x86_64')
url='https://github.com/Rolf-Hempel/MoonPanoramaMaker'
license=('GPL3')
options=('!strip')
noextract=("${pkgname}-${pkgver}.tgz")
depends=('openssl-1.0'
         'libselinux'
         'qt5-x11extras'
         'qt5-svg'
         'java-runtime'
         'gtk3'
         'gobject-introspection-runtime')
makedepends=('gendesk' 'tar' 'imagemagick')
source=("${pkgname}-${pkgver}.tgz::https://github.com/Rolf-Hempel/MoonPanoramaMaker/releases/download/V${pkgver}/MoonPanoramaMaker_V${pkgver}_Linux.tgz")
sha256sums=('7a1c9338cd3eaa97d91646be108030a6db76ad12a2a07dd12b41588a27ae53f8')

package() {
  install -d "${pkgdir}/opt"
  tar xvf ${pkgname}-${pkgver}.tgz -C "${pkgdir}/opt"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "MoonPanoramaMaker" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Multimedia;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/MoonPanoramaMaker/MoonPanoramaMaker "${pkgdir}/usr/bin/moonpanoramamaker"
  install -Dm644 ${pkgdir}/opt/MoonPanoramaMaker/MoonPanoramaMaker_User-Guide.pdf "${pkgdir}/usr/share/doc/${pkgname}"
  magick -verbose ${pkgdir}/opt/MoonPanoramaMaker/MoonPanoramaMaker.jpg moonpanoramamaker.png
  install -Dm644 moonpanoramamaker.png -t "${pkgdir}/usr/share/pixmaps/"
  chown -R root:root "${pkgdir}"
  rm "${pkgdir}/opt/MoonPanoramaMaker/MoonPanoramaMaker_User-Guide.pdf"
}
