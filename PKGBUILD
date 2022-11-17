# Maintainer: kfrx <kfrx at protonmail dot com>

pkgname=pdf-over
pkgver=4.4.3
pkgrel=1
pkgdesc='Graphical tool for creating PAdES conforming PDF signatures'
arch=('x86_64')
url='https://technology.a-sit.at/en/pdf-over/'
license=('custom:EUPL-1.1')
depends=('jre17-openjdk' 'bash')
source=("LICENSE"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-${pkgver}.jar::https://technology.a-sit.at/download/pdf-over-linux?version=${pkgver}")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('0dc4b0a3362f197e250604567a6b4eb16bbc34c186425401e2201a193a82549f'
            'ec75837f568b1c0c6d0d091dcbf71d34a36b1d1f679b07baf1e411d290410e24'
            '022c3020d228f843231469cef3fb0272fca875c2545f319dcdc97ee8001188fd'
            '3bfb29cac32bb1156093afd45f70ff9509e769d0acdeb39eaddc2dc0cf014e1e')

package() {
  /usr/lib/jvm/java-17-openjdk/bin/java -jar "${pkgname}-${pkgver}.jar" -options <(echo "INSTALL_PATH=${srcdir}/extracted") </dev/null

  install -Dm 644 extracted/lib/* -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 extracted/icons/icon144x144.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
