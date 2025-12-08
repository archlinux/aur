# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-webserver-gtk4-bin
_pkgname=Tiny-Webserver-GTK4
pkgver=1.5
pkgrel=1
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
sha256sums=('77af99a79fd8d6f54aac405c3ee671dede6099056fe590c0b04435cc72663e08')
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
