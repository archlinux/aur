# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kamkode
pkgver=0.9
pkgrel=1
pkgdesc="Platform independent multi-format 1D/2D barcode creation and detection. Detects barcode from images and using webcam"
arch=('any')
url='https://kamkode.sourceforge.io'
license=("custom:${pkgname}")
depends=('java-runtime>=8' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/kamkode/files/App/kamkode%20${pkgver}.zip/download"
        'kamkode.png')
sha256sums=('9ca8539f093d88cd039255a2fbbe273f36eff7dc4d6e7c8949927bda902216af'
            'SKIP')

package() {
  install -Dm644 "${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
  cd "${pkgname} ${pkgver}"
  install -Dm644 ${pkgname}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > kamkode.sh
  install -Dm755 kamkode.sh "${pkgdir}/usr/bin/kamkode"
  cp -aR libs/ "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "kamkode" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}