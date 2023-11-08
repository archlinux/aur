# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sixgrid-bin
_pkgname=SixGrid
pkgver=0.3.6
pkgrel=3
pkgdesc="Open-Source Desktop Client for e926/e621 and websites alike"
arch=("x86_64")
url="https://github.com/SixGrid/sixgrid"
license=("Apache")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron11'
    'java-runtime'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-58cccb3b42651ae2e53a0aaffc778b691db364c0-linux-amd64.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('d2e66e50f7003566568e33f8573f8475752cd0ecc2af0f9f1c5dc3ed4f0e9e06'
            'bb17293a769e5366fc44f5af76eeb10c7794ec771e6bd30ff0f7b98c07b199e3')
build() {
    gendesk -q -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/app.asar.unpacked/dist/electron/imgs/logo-nobackground--assets.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}