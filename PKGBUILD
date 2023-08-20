# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dk-c++-bin
_pkgname=DK-C++
pkgver=1.3.0
pkgrel=1
pkgdesc="A C++ IDE designed for easy use."
arch=('x86_64')
url="https://github.com/EntityPlantt/DK-CPP"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron19')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.7z"
    "LICENSE::https://raw.githubusercontent.com/EntityPlantt/DK-CPP/main/LICENSE.md"
    "${pkgname%-bin}.png"
    "${pkgname%-bin}.sh")
sha256sums=('3b59ed87183c16072a6db41108c940cece6d5c51a452c6a48c78f1b8d69315d2'
            '51fc2e856cf11d5b7230b8134b9950ba289b4665e114e506ac6b6be3d9849cf4'
            '5e9030919f467c76f3049b001a7a73915640bdcd82794e1ea77881789b4b2899'
            '10949683b23106664cc7b15852a6de2fd6f4c98f837236965028ee4fc8371dd8')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    asar pack "${srcdir}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}