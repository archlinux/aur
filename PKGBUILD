# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=messages4desktop-bin
_appname=GoogleMessages
pkgver=p20231029
pkgrel=1
pkgdesc="Google Messages on your desktop."
arch=('x86_64')
url="https://github.com/Randomblock1/messages4desktop"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron'
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/linux.7z"
    "${pkgname%-bin}.sh"
)
sha256sums=('c18dd2d06f9eb29579d7d30f0e84a604bb9bca56de4ae58591438eb33dd0119d'
            'e6d7f0c8d644706f1e2cbfc8b77ac610eb0d15687118eec6dd9d50ba21725c55')
build() {
    asar pack "${srcdir}/dist/${_appname}-linux-x64/resources/app" "${srcdir}/app.asar"
    gendesk -q -f -n --categories "Network" --name "Google Messages" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/dist/${_appname}-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}