# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=seekr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="System search util for linux.(Prebuilt version)"
arch=('any')
url="https://github.com/luxluth/seekr"
license=('MIT')
depends=(
    'gtk4'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${CARCH}-linux.tar.gz"

)
sha256sums=('367f5ead898e7aece7975a5f35dbb5fd020d16dc7280023f4e0497589d795cdb')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-${CARCH}-linux/"{"${pkgname%-bin}",plugins} "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${CARCH}-linux/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${CARCH}-linux/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}