# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=medict-bin
_pkgname=Medict
pkgver=_3.0.1_alpha_085bf3
pkgrel=1
pkgdesc="A cross platform dictionary application,support mdict (*.mdx/*.mdd) dictionary format"
arch=("x86_64")
url="https://github.com/terasum/medict"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('webkit2gtk' 'gdk-pixbuf2' 'glibc' 'gtk3' 'glib2')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver//_/-}/${_pkgname}_v${pkgver//_/-}_Linux_${CARCH}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/terasum/medict/v${pkgver//_/-}/build/assets/darwin/appicon.png")
sha256sums=('eb60dcaec4a6e7c8c6132212580765943cb128beab1961ab938231bc9c23206a'
            'feafee440d86c5abd9d525ee78102209125c4d6e4275e99b6d4452fdc2f1995c')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}