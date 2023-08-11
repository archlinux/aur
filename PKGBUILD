# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>

pkgname=midica
pkgver=1.5.6
pkgrel=1
pkgdesc="A Music programming language. Translates source code into MIDI. Includes a player. Supports MIDI-Karaoke. Includes a MIDI analyzer"
arch=('any')
url='http://www.midica.org'
license=('MPL2')
depends=('java-runtime>=7' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar::https://github.com/truj/midica/releases/download/${pkgver}/midica.jar")
sha256sums=('ce0c62f66373eae3c8d8890b0e0e8b09f714087071afbdc0b96894837890fbe3')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 org/midica/resources/app-icon.png "${pkgdir}/usr/share/pixmaps/midica.png"
  echo "#!/bin/sh
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > midica.sh
  install -Dm755 midica.sh "${pkgdir}/usr/bin/midica"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Midica" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;AudioVideo;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
