# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bulkurlopener-bin
_pkgname=BulkURLOpener
pkgver=1.12.0
pkgrel=4
pkgdesc="An application that provides the user with multiple utilities to help with managing and using large amounts of urls"
arch=("x86_64")
url="https://bulkurlopener.com/"
_githuburl="https://github.com/EuanRiggans/BulkURLOpener"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron20'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "LICENSE::https://raw.githubusercontent.com/EuanRiggans/BulkURLOpener/${pkgver}/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/EuanRiggans/BulkURLOpener/${pkgver}/app/icon/128.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('793be180c3a33e952b64aed41c6f8dff8023987ac620f39d0877df4cb7e27ced'
            '02fee1b93a53fbf997a300a147ea7efb5fe2deee2f0d0c6d2f66862a7b7079c7'
            'bd7825f6ae86c0d580b50ca9e7885e15af5ad2a81689a8e2d41decb70231fad5'
            '950e65d2497a75fb73306ea8dbeedab8062d7d576f2aa489000ec5cf6e361585')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}