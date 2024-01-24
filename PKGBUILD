# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bulkurlopener-bin
_pkgname=BulkURLOpener
pkgver=1.12.0
_electronversion=20
pkgrel=6
pkgdesc="An application that provides the user with multiple utilities to help with managing and using large amounts of urls"
arch=("x86_64")
url="https://bulkurlopener.com/"
_ghurl="https://github.com/EuanRiggans/BulkURLOpener"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/EuanRiggans/BulkURLOpener/${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/EuanRiggans/BulkURLOpener/${pkgver}/app/icon/128.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('793be180c3a33e952b64aed41c6f8dff8023987ac620f39d0877df4cb7e27ced'
            '02fee1b93a53fbf997a300a147ea7efb5fe2deee2f0d0c6d2f66862a7b7079c7'
            'bd7825f6ae86c0d580b50ca9e7885e15af5ad2a81689a8e2d41decb70231fad5'
            '1d3f21d54a2d9d1a53661bd91c2afd00df79b0ce4057a66b4c953febfc464cd8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}