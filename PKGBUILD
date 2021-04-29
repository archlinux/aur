# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=embeetle-ide
pkgver=0.2.6
pkgrel=1
pkgdesc="A new IDE for microcontrollers, built from scratch"
arch=('x86_64')
url='https://embeetle.com'
license=('custom')
depends=('gtk3'
         'qt5-svg'
         'qt5-tools'
         'qt5-sensors'
         'qt5-location'
         'qt5-x11extras'
         'qt5-multimedia'
         'qt5-webchannel')
source=("${pkgname}-${pkgver}::https://embeetle.com/downloads/linux/embeetle.tar.gz"
		"LICENSE")
sha256sums=('8a42d1429eae8500348ea79251b6da925a318081ed5f2360dd42fe28cd42eae6'
            'd5353ae25be837afd2dbd385a5bc6dc580e007c786798795d045b4d799bebcf1')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/share/pixmaps"
  cp -avR "${srcdir}/embeetle" "${pkgdir}/opt/"
  echo "#!/bin/env bash
  cd /opt/embeetle/beetle_core/
  ./embeetle" > embeetle-ide.sh
  install -Dm755 embeetle-ide.sh "${pkgdir}/usr/bin/embeetle-ide"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "${pkgdesc}" \
          --name "Embeetle IDE" \
          --comment "${pkgdesc}" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;IDE;'
  install -Dm644 embeetle-ide.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/embeetle/beetle_core/resources/icons/square_logo.png" \
   "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
