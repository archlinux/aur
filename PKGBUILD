# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=infoz-bin
pkgver=0.0.9
pkgrel=2
pkgdesc="See your system information graphically.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/erfanbanaei/infoz"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/linux-release-v${pkgver}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/erfanbanaei/infoz/v${pkgver}/web/icons/Icon-512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('3a2d41ba78b990c7b1ab02cfc9a88710d71f92af7958196d79b53a6a77616920'
            'baccb205ae45f0b421be1657259b4943ac40c95094ab877f3bcbe12cd544dcbe'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-nin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}