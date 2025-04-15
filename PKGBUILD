# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-webserver-gtk4-bin
_pkgname=Tiny-Webserver-GTK4
pkgver=1.3
pkgrel=2
pkgdesc="A tiny webserver with GTK4 GUI written in C for Linux.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Lennart1978/tiny-webserver-gtk4"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk4'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}::${url}/releases/download/V${pkgver}/webserver-gtk"
)
sha256sums=('1736a5410a2dc818a436ef275959d6b0879a0af8290f8b2bbee2b4b739f86b09')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development;Web;" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}