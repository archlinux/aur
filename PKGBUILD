# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=23_03_30
pkgrel=6
pkgdesc="Open source GUI application that enables you to interact with Amphitheatre"
arch=('x86_64')
url="https://github.com/amphitheatre-app/desktop"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'fontconfig'
    'freetype2'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${CARCH}-unknown-linux-gnu.tar.gz"
)
sha256sums=('bdd376034e4b762a5d841c912270b20a72748cec6dabaa2cecb7a86e0aede80c')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${CARCH}-unknown-linux-gnu/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${CARCH}-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}