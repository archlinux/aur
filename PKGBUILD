# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="typesense-dashboard-bin"
_pkgname="Typesense-Dashboard"
pkgver=1.3.1
pkgrel=2
pkgdesc="A Typesense Dashboard to manage and browse collections."
arch=('x86_64')
url="https://bfritscher.github.io/typesense-dashboard/"
_githuburl="https://github.com/bfritscher/typesense-dashboard"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/bfritscher/typesense-dashboard/main/public/icons/favicon-128x128.png"
    "${pkgname%-bin}.sh")
sha256sums=('ad0b4a4766d69786bdc442354a20c8d23eda37582f182df9e3e8a63b8216e85f'
            'ce61a0d27e9167938ce2083e1391de1ee514b40d8a0f5c3602a7a04f449f6779'
            'f2fd616d3e75fbbbe5d881a63c0e03d025febcda73fb642d5409d43e893c0438')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/dist/electron/${_pkgname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_pkgname}" --exec "/opt/${pkgname%-bin}/${_pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}