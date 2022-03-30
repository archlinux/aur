# Maintainer: kfrx <kfrx at protonmail dot com>

pkgname=pdf-over
pkgver=4.3.3
pkgrel=1
pkgdesc='Graphical tool for creating PAdES conforming PDF signatures'
arch=('x86_64')
url='https://technology.a-sit.at/en/pdf-over/'
license=('custom:EUPL-1.1')
depends=('java-runtime' 'bash')
source=("LICENSE"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-${pkgver}.jar::https://technology.a-sit.at/download/pdf-over-linux?version=${pkgver}")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('0dc4b0a3362f197e250604567a6b4eb16bbc34c186425401e2201a193a82549f'
            'b4a76a91b8184825b89274c1cfa0eb611655cc052b197ff4df6a32a0f17c9d59'
            '022c3020d228f843231469cef3fb0272fca875c2545f319dcdc97ee8001188fd'
            '3ec71ebf2f61bfbbe548be13b0ad59bf70b84e7049c9fe1b1dc6730ae879e5d5')

package() {
  java -jar "${pkgname}-${pkgver}.jar" -options <(echo "INSTALL_PATH=${srcdir}/extracted")

  install -Dm 644 extracted/lib/* -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm 644 extracted/icons/icon144x144.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
