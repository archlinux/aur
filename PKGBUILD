# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deskcal-bin
_appname=Deskcal
pkgver=1.0.6
pkgrel=6
pkgdesc="An unofficial cross-platform desktop Google Calendar application."
arch=('x86_64')
url="https://github.com/cognophile/Deskcal"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron18'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('ab340f34a05895da69c61e1462b4b7d422e79b219633ed41f4e7d1a7ddf67d6a'
            '8b86d12f9e2ab842a6137ab9a2949a2067ff748d70ae0c9d0cdccb863e73426f')
build() {
    gendesk -q -f -n --categories "Utility" --name "Google ${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}