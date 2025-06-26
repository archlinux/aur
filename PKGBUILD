# Maintainer: kfrx <kfrx at protonmail dot com>

pkgname=pdf-over
pkgver=4.4.6
pkgrel=1
pkgdesc='Graphical tool for creating PAdES conforming PDF signatures'
arch=('x86_64')
url='https://technology.a-sit.at/en/pdf-over/'
license=('custom:EUPL-1.2')
depends=('jre21-openjdk' 'bash')
optdepends=('libfido2: FIDO2 support')
source=("LICENSE"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-${pkgver}.jar::https://technology.a-sit.at/download/pdf-over-linux?version=${pkgver}")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665'
            'db6de14fe05b90fc9fa1fea4ecf04cce2783a93b8d2e6ad64746dfbca9bd091c'
            '022c3020d228f843231469cef3fb0272fca875c2545f319dcdc97ee8001188fd'
            'faaa4263b46a4207472d07c2dff5e2a3df75b47ef476014f32cf84bd200807ce')

package() {
  /usr/lib/jvm/java-21-openjdk/bin/java -jar "${pkgname}-${pkgver}.jar" -options <(echo "INSTALL_PATH=${srcdir}/extracted") </dev/null

  install -Dm 644 extracted/lib/* -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 extracted/icons/icon144x144.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
