# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=typesense-dashboard-bin
_pkgname="Typesense-Dashboard"
pkgver=1.4.0
pkgrel=3
pkgdesc="A Typesense Dashboard to manage and browse collections."
arch=('x86_64')
url="https://bfritscher.github.io/typesense-dashboard/"
_ghurl="https://github.com/bfritscher/typesense-dashboard"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron25'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/bfritscher/typesense-dashboard/v${pkgver}/public/icons/favicon-128x128.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('d7badb7fd7c3171893aadf3e26e7abae9da82e50498a27738f95de176ad169ca'
            'ce61a0d27e9167938ce2083e1391de1ee514b40d8a0f5c3602a7a04f449f6779'
            '095ab29c3501590090055f0ba4cd8449d96b77886a74981bc51dfb7865f0396b')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/dist/electron/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}