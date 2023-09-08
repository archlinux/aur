# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sixgrid-bin
_pkgname=SixGrid
pkgver=0.3.6
pkgrel=2
pkgdesc="Open-Source Desktop Client for e926/e621 and websites alike"
arch=("x86_64")
url="https://github.com/SixGrid/sixgrid"
license=("Apache")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron11')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-58cccb3b42651ae2e53a0aaffc778b691db364c0-linux-amd64.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('d2e66e50f7003566568e33f8573f8475752cd0ecc2af0f9f1c5dc3ed4f0e9e06'
            '62e267ad9994a89e998fd6d332ff0e3c4a82bd32bed10be687e12eb10bc17409')
prepare() {
    asar e "${srcdir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar.unpacked/dist/electron/imgs/logo-nobackground--assets.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}