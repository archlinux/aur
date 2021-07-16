# Maintainer: kfrx <kfrx at protonmail dot com>

pkgname=pdf-over
pkgver=4.3.1
pkgrel=1
pkgdesc='Graphical tool for creating PAdES conforming PDF signatures'
arch=('x86_64')
url='https://technology.a-sit.at/en/pdf-over/'
license=('custom:EUPL-1.1')
depends=('java-runtime' 'bash')
makedepends=('jre11-openjdk-headless')
source=("LICENSE"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-${pkgver}.jar::https://technology.a-sit.at/downloads/4232")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('0dc4b0a3362f197e250604567a6b4eb16bbc34c186425401e2201a193a82549f'
            'ba7ef05d1368d3c3235b2306047424e37a2707ef215203822f15b85b8c11cf8f'
            '022c3020d228f843231469cef3fb0272fca875c2545f319dcdc97ee8001188fd'
            'dfd991e51bfb93456d6593c9d1a647439fa39eb06d417c7518fd919f1a2db507')

package() {
  /usr/lib/jvm/java-11-openjdk/bin/java -jar "${pkgname}-${pkgver}.jar" -options <(echo "INSTALL_PATH=${srcdir}/extracted")
  java -jar extracted/lib/pdf-over-install-helper.jar
  rm extracted/lib/pdf-over-install-helper.jar

  install -Dm 644 extracted/lib/* -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 extracted/icons/icon144x144.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
