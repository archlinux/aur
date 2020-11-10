# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pdfjuggler
pkgver=1.0
pkgrel=1
pkgdesc="A desktop tool to mix, reorder and select PDF pages"
arch=('any')
url='https://www.bernardi.cloud/pdfjuggler'
license=('GPL3')
depends=('java-runtime>=8' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar::https://github.com/bernarpa/pdfjuggler/releases/download/v${pkgver}/pdfjuggler-${pkgver}.jar"
        "${pkgname}.png::https://github.com/bernarpa/pdfjuggler/raw/main/graphics/icon-256.png")
sha256sums=('d2cf2647dcb14814e80deed17f0c3fd70e2f87bed376512a3ee2e4dd3f7fadb7'
            'a4a8891791ec582e27bdcf8149a01340494c0613e9728f37d285fb56dc1a73b1')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > pdfjuggler.sh
  install -Dm644 ${pkgname}.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm755 pdfjuggler.sh "${pkgdir}/usr/bin/pdfjuggler"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "PDF Juggler" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
