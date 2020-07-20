# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=skydocs
pkgver=0.7.4
pkgrel=1
pkgdesc="A lightweight static documentation builder with MarkDown"
arch=('any')
url='https://skydocs.skyost.eu'
license=('GPL3')
depends=('java-runtime>=8' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.zip::https://github.com/Skyost/SkyDocs/releases/download/v${pkgver}/SkyDocs.Jar.zip")
sha256sums=('1780bfce67e1f4fad14aa500fa2df6c96cd3c3b34d7c2bb4beee93ebc45a6445')

package() {
  install -Dm644 SkyDocs-v${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > skydocs.sh
  install -Dm755 skydocs.sh "${pkgdir}/usr/bin/skydocs"
  jar xf SkyDocs-v${pkgver}.jar main/resources/default_theme/assets/img/icon.png
  install -Dm644 main/resources/default_theme/assets/img/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "SkyDocs" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}