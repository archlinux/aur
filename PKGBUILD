# Maintainer: kfrx <kfrx at protonmail dot com>

pkgname=pdf-over
pkgver=4.4.8
pkgrel=1
pkgdesc='Graphical tool for creating PAdES conforming PDF signatures'
arch=('x86_64')
url='https://technology.a-sit.at/en/pdf-over/'
license=('custom:EUPL-1.2')
depends=('jre21-openjdk' 'bash')
optdepends=('libfido2: FIDO2 support')
source=("LICENSE"
        "${pkgname}"
        "PDF-Over.desktop"
        "${pkgname}-${pkgver}.jar::https://technology.a-sit.at/wp-content/uploads/2026/03/PDF-Over-${pkgver}.jar")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665'
            '9e410f7c97ea480d018f35d96f69ea91e97ce73a79f2a5bb99eaa65846789f70'
            '022c3020d228f843231469cef3fb0272fca875c2545f319dcdc97ee8001188fd'
            'fda2465b531ddd0def93261d8eea5fc79db9660ba4d53cfd71d7d3ca1fb2a290')

package() {
  /usr/lib/jvm/java-21-openjdk/bin/java -jar "${pkgname}-${pkgver}.jar" -options <(echo "INSTALL_PATH=${srcdir}/extracted") </dev/null

  install -Dm 644 extracted/lib/* -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 extracted/icons/icon144x144.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "PDF-Over.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
