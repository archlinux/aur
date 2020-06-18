# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pvts
pkgver=0.243
pkgrel=1
pkgdesc='A visual interpreter for the Scheme programming language writen in Java'
arch=('any')
url='http://davidpilo.github.io/pvts/'
license=('custom:unknown')
depends=('java-runtime>=8' 'bash')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.jar")
source=("${pkgname}-${pkgver}.jar::https://github.com/davidpilo/pvts/raw/master/dist/${pkgver}/PVTS.jar"
        'pvts.png')
sha256sums=('24f4600bcb8d792f8ad848056e38cda2e548e1a48ee3c77e07529cae5c013193'
            'SKIP')

package() {
  install -Dm644 "${pkgname}-${pkgver}.jar" -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  java -jar /usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar" > ${pkgname}.sh
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  gendesk -f -n --pkgname "Pilo Visual Tools for Scheme" \
         --pkgdesc "${pkgdesc}" \
         --exec="pvts" \
         --categories=Application\;Development \
         --icon ${pkgname}
  install -Dm644 *.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ${pkgname}.png -t "${pkgdir}/usr/share/pixmaps"
}
# vim:set ts=2 sw=2 et: