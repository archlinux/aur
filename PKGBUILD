# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=codequill-bin
_pkgname=CodeQuill
pkgver=2.0.4
pkgrel=1
pkgdesc="Organize, edit, and preview code efficiently.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/The-Best-Codes/codequill"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/The-Best-Codes/codequill/v${pkgver}/LICENSE"
)
sha256sums=('ae4632d5c93f5dbcae62945325d817c1f1d3c3f86dbb1f68f09e13701bd8bb0b'
            'e2622fda505a7eabcf269cffe9708431c6704d9fc8dbfaef1d642dad323cea9c')
prepare() {
    sed -i "s/Categories=/Categories=Development;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}