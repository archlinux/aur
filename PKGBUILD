# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine-bin
_appname=AFFiNE
pkgver=0.10.3
_electronversion=27
pkgrel=2
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'sqlite'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-stable-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/packages/frontend/core/public/favicon-192.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/toeverything/AFFiNE/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('6d8767420d44c5fbae62e62315e3aa69ea59d7243bca341c951f383982f3def2'
            '55bc02a073dc08f696af3b0a7febace5176c20920dea55e2ceb29d9b0ac1e7ac'
            'b54bb7aa14dd5725bc268921eeea9dee973dacbc13e0cea30e7d2adb5cd5a53f'
            '4df1e45e197e6da6b61314c201c27c01c10f0aba4230c419abaed18afb68410b')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-bin}"
    sed -i "s|@electronversion@|${_electronversion}|" "$srcdir/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_appname}-linux-x64/resources/app.asar.unpacked/dist/${pkgname%-bin}.linux-x64-gnu.node" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/dist"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}