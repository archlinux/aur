# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=esplorer
pkgver=0.2.0_rc3
pkgrel=2
pkgdesc="Integrated Development Environment (IDE) for ESP8266 developers"
arch=('any')
url="http://esp8266.ru/${pkgname}"
license=('GPL2')
depends=('bash' 'java-runtime')
makedepends=('gendesk')
source=("${pkgname}.zip::http://esp8266.ru/${pkgname}-latest/?f=ESPlorer.zip"
        "${pkgname}.png::https://raw.githubusercontent.com/4refr0nt/ESPlorer/master/ESPlorer/src/resources/ESP8266-96x96.png")
sha256sums=('1972df51f1397d7c562555c86097d80a4f60f28b46baf0dcf4fca8b44c8ec91a'
            '52f9473d01b5b0bfad5eeff47b82ef322589622a98fa1ac8fbb0afff080950d5')

prepare() {
  gendesk -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --categories "Development;Network;Building;IDE"
  echo -e "#!/bin/sh\njava -jar /usr/share/java/${pkgname}/ESPlorer.jar" > ${pkgname}.sh
}

package() {
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 ESPlorer.jar "${pkgdir}/usr/share/java/${pkgname}/ESPlorer.jar"
  cp -r lib "${pkgdir}/usr/share/java/${pkgname}/"
}
