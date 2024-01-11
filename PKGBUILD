# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=angular-electron-bin
_pkgname="Angular Electron"
pkgver=1.4.3
_pkgver=12.0.0
_electronversion=23
pkgrel=1
pkgdesc="Bootstrap and package your project with Angular 15 and Electron 21 (Typescript + SASS + Hot Reload) for creating Desktop applications."
arch=('x86_64')
url="https://github.com/malacration/sap-front"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=('gendesk')
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${_pkgver}.tar.gz"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/malacration/sap-front/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/malacration/sap-front/v${pkgver}/src/assets/icons/favicon.512x512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('b35b4be4648db93e9a21387a2e0052eb0943d634b702dd7411034efb08eacda5'
            '00df8834a94ab4d44c7c7d6557cce6af143ed0019a80c682b5a03d0cea8187b4'
            'e88e5f0dc9ca423464c686e2100c7ff48e88474401f099086151a3b13be52c4b'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${_pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}