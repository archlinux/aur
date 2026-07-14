# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=medict-bin
_pkgname=Medict
pkgver=3.1.4
pkgrel=1
pkgdesc="A cross platform dictionary application,support mdict (*.mdx/*.mdd) dictionary format.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/terasum/medict"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_${CARCH}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/terasum/medict/v${pkgver}/build/assets/darwin/appicon.png"
)
sha256sums=('3cf43a7cc7adc345c6e4195f0771fc3c22befe5066382b40e249c3d6896da729'
            'feafee440d86c5abd9d525ee78102209125c4d6e4275e99b6d4452fdc2f1995c')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
