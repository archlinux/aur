# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gotepad-bin
pkgver=2.6.2
pkgrel=1
pkgdesc="A simple text editor built with Wails"
arch=('x86_64')
url="https://github.com/Sammy-T/gotepad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gdk-pixbuf2'
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Sammy-T/gotepad/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Sammy-T/gotepad/v${pkgver}/build/appicon.png"
)
sha256sums=('08f53437b9d1e2b1fa0c70d6c197c1cdfa5b0e2152b955ae6b4ee00057ff0fd1'
            'dca196dfc07025990b7613625b114fa8ae063e0fb5de6f29a81e42ffd1b5eaae'
            '6d3beef0cac0b65e2a25e326970302b7efdac1c66f8c4f4bfe469fe49df30763')
build() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/build/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}