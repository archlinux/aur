# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deskcal-bin
_appname=Deskcal
pkgver=1.0.6
pkgrel=5
pkgdesc="An unofficial cross-platform desktop Google Calendar application."
arch=('x86_64')
url="https://github.com/cognophile/Deskcal"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron18')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}.zip"
    "${pkgname%-bin}".sh)
sha256sums=('ab340f34a05895da69c61e1462b4b7d422e79b219633ed41f4e7d1a7ddf67d6a'
            'a9e27d2089f41ab6aa42641625872d7cc733ade66376c7973ac3f04e7fe32fcc')
prepare() {
    asar pack "${srcdir}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Utility" --name "Google ${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}