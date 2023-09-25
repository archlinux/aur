# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dk-c++-bin
_pkgname=DK-C++
pkgver=1.3.0
pkgrel=2
pkgdesc="A C++ IDE designed for easy use."
arch=('x86_64')
url="https://github.com/EntityPlantt/DK-CPP"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron19')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.7z"
    "LICENSE.md::https://raw.githubusercontent.com/EntityPlantt/DK-CPP/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.png"
    "${pkgname%-bin}.sh")
sha256sums=('3b59ed87183c16072a6db41108c940cece6d5c51a452c6a48c78f1b8d69315d2'
            '118e8d39dc5b8e68c533eb798f8e569b056c1238c7d8a2ab4c7eefd7067eea0d'
            '5e9030919f467c76f3049b001a7a73915640bdcd82794e1ea77881789b4b2899'
            '8ecae0d63b04a0185749546adf39739a38327d0fcc6368739bc4e46efbdd6bae')
build() {
    asar pack "${srcdir}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}