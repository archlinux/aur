# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midica
pkgver=1.4.2
pkgrel=1
pkgdesc="A Music programming language. Translates source code into MIDI. Includes a player. Supports MIDI-Karaoke. Includes a MIDI analyzer"
arch=('any')
url='http://www.midica.org'
license=('MPL2')
depends=('java-runtime>=7' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar::https://github.com/truj/midica/releases/download/${pkgver}/midica.jar")
sha256sums=('586876e9b6cae9e82c31db723e047fc65aa6a27bd411ce037ce27cbffc5f5284')

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
