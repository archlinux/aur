# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bookscanwizard
pkgver=2.0.2c
pkgrel=1
pkgdesc="A utility to help with Book scanning using cameras as a scanner. It will automate things such as cropping, rotating, fixing keystoning, fixing the DPI, and outputing it to tiff files that can be changed into PDF's or ebooks"
arch=('any')
url="https://sourceforge.net/projects/bookscanwizard"
license=('custom:unknown')
depends=('java-environment>=7' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/bookscanwizard/files/BookScanWizard_${pkgver}.zip/download")
sha256sums=('cfef50b1ed5601c6ec4041623a634b8a283fca4f5414a2353fdbef943852427a')

package() {
  install -Dm644 BookScanWizard.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  cp -aR lib "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 bsw.png -t "${pkgdir}/usr/share/pixmaps/"
  echo "#!/usr/bin/env bash
  java -Xmx8192M -jar /usr/share/java/${pkgname}/BookScanWizard.jar" > bsw.sh
  install -Dm755 bsw.sh "${pkgdir}/usr/bin/bsw"
  gendesk -f -n --pkgname bsw \
          --pkgdesc "$pkgdesc" \
          --name "Book Scan Wizard" \
          --comment "$pkgdesc" \
          --exec bsw \
          --categories 'Utility;Application;' \
          --icon bsw
  install -Dm644 bsw.desktop -t "${pkgdir}/usr/share/applications"
}