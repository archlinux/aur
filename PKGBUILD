# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=caffviewer
pkgver=latest
pkgrel=1
pkgdesc="The de·caff Viewer version 3.x is a pure Java program for viewing AutoCAD® DWG, DXF and SHX files"
arch=('any')
url='https://caff.de/projects/caffviewer/'
license=('Apache' "custom:${pkgname}")
depends=('java-runtime>=8' 'bash')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.jar")
source=("${pkgname}-${pkgver}.jar::https://caff.de/projects/caffviewer/caffviewer.jar"
        'LICENSE'
        'caffviewer.png')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > caffviewer.sh
  install -Dm755 caffviewer.sh "${pkgdir}/usr/bin/caffviewer"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "de·caff Viewer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Graphics;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 caffviewer.png -t "${pkgdir}/usr/share/pixmaps"
}