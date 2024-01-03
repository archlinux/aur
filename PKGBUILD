# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=amphitheatre-desktop-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Open source GUI application that enables you to interact with Amphitheatre"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/amphitheatre-app/desktop"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.tar.gz")
sha256sums_aarch64=('a599d89f30a9796f436804268b7e845d5c97580285e3a4a7ed63bdd2a3257a80')
sha256sums_x86_64=('9c9a17e16e26d0721f341de0580606ef13e0fb56b240d61ef4212195a36f9ef8')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}