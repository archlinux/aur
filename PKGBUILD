# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monolith-code-bin
pkgver=2.2.5
pkgrel=1
pkgdesc="minimalistic but powerful code editor"
arch=("x86_64")
url="https://haeri.github.io/monolith-code"
_ghurl="https://github.com/Haeri/monolith-code"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron26'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Haeri/monolith-code/v${pkgver}/res/img/icon.png"
    "LICENSE::https://raw.githubusercontent.com/Haeri/monolith-code/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('23ed9785ec6229e0ef96c9afca60b669543d36882d49c72a74682484074a99be'
            'fc337a1441eedf5ba5cf89db2d688599356efef702c28eb72843e36bcd81cf27'
            '08712c74fe995972923ce4a30fa74bad068779afdf9d3b877c525e86c617adcc'
            '4b7f270c9d8e71af058f2d63ddd5cbdbe8367bb4bd2980b244ea0e6871c31feb')
build() {
    gendesk -q -f -n --categories "Development" --name="${pkgname%-bin}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/applications"
}