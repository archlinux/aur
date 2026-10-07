# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xresconv-gui-bin
pkgver=3.0.0
_electronversion=41
pkgrel=1
pkgdesc="A GUI batch table conversion tool that conforms to the xresconv-conf specification, with xresloader as the conversion backend."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/xresloader/xresconv-gui"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'libayatana-indicator'
    'libappindicator'
    'nodejs'
    'python'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/owent/xresconv-gui/v${pkgver}/docs/logo.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/owent/xresconv-gui/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64-bootstrap.tar.zst")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64-bootstrap.tar.zst")
options=(
    '!strip'
    '!emptydirs'
)
sha256sums=('7ed93f61f67710129b3756a2c50d9cdb316e8faae5b4080d9a5df93dc33bbfd4'
            '04855dd97336c31e617fba43527ab81b7745f7057641a05eaef99824ec564fb1')
sha256sums_aarch64=('cd082b126cba7d101fb8a3f0cc0e75f0ea9768ca955a09300e2477e6325d5182')
sha256sums_x86_64=('27fbc6968083946416acb642d70f9e1af2a6d4ee6a68031027a01477c9b90b4b')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U"
    ln -sf "/usr/bin/node" "${srcdir}/${pkgname%-bin}/runtime/node"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -a "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
