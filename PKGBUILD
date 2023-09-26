# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-messages-bin
_pkgname=GoogleMessages
pkgver=1.4.2
pkgrel=2
pkgdesc='A "native-like" OS X, Windows, & Linux desktop app for Google Messages'
arch=('x86_64')
url="https://www.messagesfordesktop.com/"
_githuburl="https://github.com/kelyvin/Google-Messages-For-Desktop"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron19')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-linux_v${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('204112783720e2428ec0ad78ebd9f95f30bf9c77959d4ebd6232be30da98970a'
            'd196811a7077bdbb12e1e7c3b172c99243755a7f23eb8e4ce74a747bd4343069')
build() {
    asar pack "${srcdir}/${_pkgname}-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -q -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {   
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}