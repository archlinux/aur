# Maintainer: Marcos Alguacil <marcos.alguacil@gmail.com>

pkgname=carfirma-bin
pkgver=2.0
pkgrel=2
pkgdesc='Cliente de firma electrónica de la Administración Pública de la Comunidad Autónoma de La Rioja'
arch=('x86_64')
url='https://www.larioja.org/oficina-electronica/es/firma-electronica/carfirma'
license=('GPL' 'custom:EUPL')
depends=('java-runtime=8')

source=("${pkgname}-${pkgver}.deb::https://ias1.larioja.org/carFirma/descargas/exe/Instalacion_carFirma_64.deb"
        "carFirma"
        "carfirma.desktop"
        "carFirma.js")
b2sums=('eac14f62c7323e90fd68644a67374f42f7a985778f8c5182a573ea030875132f32c7433c5a7cad586b303001c3ff524f48a44ebc2fd020066edec3c5a6853d81'
        '270ab583c309c26245790b732d5421e7ca972815c8b68a4ee31a3493cc7862f50c2285c5f20adab504e36947e75ff50a37cc933231b5d46c87ad5d674484f770'
        '08e1ef142e248a77f95d3a4a34bf275b53003c49a3fd08c65a3cc8f76ae7a3da5583e64951255697fba3a4c860dd107d06119e956829c57d5ba4370680ed1b64'
        'c673d01048b696ee0cdbab72a557b596580168f69b18934f7796b59143b1f30bc2f8374eb15dbf66f88a1a9a186a3d5733da88f46741f95206026538f6775880')

prepare() {
  # Extract debian package
  bsdtar -O -xf "${pkgname}-${pkgver}"*.deb data.tar.xz | bsdtar -C "${srcdir}" -xJf -
}

package() {
  install -Dm755 "carFirma" \
    "${pkgdir}/usr/bin/carFirma"
  install -Dm644 "carFirma.js" \
    "${pkgdir}/usr/lib/firefox/defaults/pref/carFirma.js"
  install -Dm644 "usr/lib/carFirma/carFirmaApp.jar" \
    "${pkgdir}/usr/share/java/carFirma/carFirmaApp.jar"
  install -Dm644 "usr/share/carFirma/carfirma.svg" \
    "${pkgdir}/usr/share/pixmaps/carfirma.svg"
  install -Dm644 "carfirma.desktop" \
    "${pkgdir}/usr/share/applications/carfirma.desktop"
  install -Dm644 "usr/share/common-licenses/eupl-carfirma-1.1.txt" \
    "${pkgdir}/usr/share/licenses/carFirma/eupl-carfirma-1.1.txt"
  install -Dm644 "usr/share/common-licenses/gpl-carfirma-2.0.txt" \
    "${pkgdir}/usr/share/licenses/carFirma/gpl-carfirma-2.0.txt"
}
