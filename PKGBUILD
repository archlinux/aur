# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frosch-bin
pkgver=2.0.2
pkgrel=2
pkgdesc="Frosch, software para juego de rana electrónica o rana digital."
arch=('i686' 'x86_64')
url="https://github.com/ivanrey/Frosch"
license=('MIT')
depends=('electron11' 'bash')
makedepends=('asar')
conflicts=("${pkgname%-bin}")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/Frosch-linux-ia32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/Frosch-linux-x64.zip")
source=("LICENSE::https://raw.githubusercontent.com/ivanrey/Frosch/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('70d564391aa89ca77317a0716d27d450d939c41d0554a66da392b28784d6fa7d'
            'e57e0959b9cfc7c7fc863991ce487e865020e369b757a0438bf5b4fe55a1a424')
sha256sums_i686=('78ca0dbd64a0e6e1155632219d3990a76358abd8c385ef88a7094edc1a8aa8b6')
sha256sums_x86_64=('16841565eecd5b9946711cfafdf9a0959c60fada1870c624f5d65f31cc31252f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/resources/app/icono.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Game" --name "Frosch" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}