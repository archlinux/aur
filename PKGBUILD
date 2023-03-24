# Maintainer: kfrx <kfrx at protonmail dot com>

pkgname=pdf-over
pkgver=4.4.5
pkgrel=1
pkgdesc='Graphical tool for creating PAdES conforming PDF signatures'
arch=('x86_64')
url='https://technology.a-sit.at/en/pdf-over/'
license=('custom:EUPL-1.2')
depends=('jre17-openjdk' 'bash')
source=("LICENSE"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-${pkgver}.jar::https://technology.a-sit.at/download/pdf-over-linux?version=${pkgver}")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665'
            'ec75837f568b1c0c6d0d091dcbf71d34a36b1d1f679b07baf1e411d290410e24'
            '022c3020d228f843231469cef3fb0272fca875c2545f319dcdc97ee8001188fd'
            'f30c5252930c166cb2315a3809b059c81679c1159303ae830518d3af5f270b90')

package() {
  /usr/lib/jvm/java-17-openjdk/bin/java -jar "${pkgname}-${pkgver}.jar" -options <(echo "INSTALL_PATH=${srcdir}/extracted") </dev/null

  install -Dm 644 extracted/lib/* -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 extracted/icons/icon144x144.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
