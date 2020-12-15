# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=qrcodegen-java
pkgver=1.14.2
pkgrel=1
pkgdesc='A handy software utility that helps you convey messages via QR codes. With support for anything from free text to URLs, WLAN credentials, emails, and geo URI schemes'
arch=('any')
url='https://sites.google.com/site/qrcodeforwn/home/qr-code-generator-for-wireless-networks'
license=('GPL3')
depends=('java-runtime=8' 'bash')
makedepends=('gendesk')
source=("${pkgname%-java}-${pkgver}.zip::https://softpedia-secure-download.com/dl/6a4f3749ea015fbc07271ee6202afc53/5fd888f5/100256346/software/portable/multimedia/graphics/qrcodegen_${pkgver}.zip"
        'qrcodegen.png')
sha256sums=('48144b8d2f309f4324a85fcd7261244581678fb438a0a49f3a84b8ffcf07b09b'
            '7f4d109a4d81e0bc970adb3f3355f422e979c33d0425e61f8e1acf126bda6ca4')

package() {
  cd qrcodegen
  echo "#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/qrcodegen/qrcodegen.jar' \"\$@\"" > qrcodegen
  install -Dm755 QRCodeGen.jar "${pkgdir}/usr/share/java/qrcodegen/qrcodegen.jar"
  install -Dm755 qrcodegen "${pkgdir}/usr/bin/qrcodegen"
  install -Dm644 ${srcdir}/qrcodegen.png -t "${pkgdir}/usr/share/pixmaps"
  gendesk -f -n --pkgname "${pkgname%-java}" \
          --pkgdesc "$pkgdesc" \
          --name "QR-Code Generator" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-java}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-java}"
  install -Dm644 "${pkgname%-java}.desktop" -t "${pkgdir}/usr/share/applications"
}
