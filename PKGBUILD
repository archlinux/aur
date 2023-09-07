# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-canary-bin
_appname=AFFiNE-canary
pkgver=0.9.0_canary.10
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use.Beta Version."
arch=('x86_64')
url="https://affine.pro/"
_githuburl="https://github.com/toeverything/AFFiNE"
license=('MPL2')
provides=("${pkgname%-canary-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-canary-bin}")
depends=('bash' 'electron26' 'sqlite')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64.zip"
    "LICENSE::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('57bbdef82ff1b9a93f32a8d96da5206e44f0e540f299b8eeec7f650d77c26082'
            '91b2b15b405f2242ceaf5032d70cde3b501fa7006db7246af510732045a12552'
            '2ea5529b389430ce5b8ee16c10feeed6808b862a843cbd4d4b48e5d2af2887a0')
prepare() {
    asar pack "${srcdir}/${_appname}-linux-x64/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}