# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tauview-bin
_pkgname=Tauview
pkgver=0.0.12
pkgrel=2
pkgdesc="Minimalist image viewer based on Leaflet.js and Tauri.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/sprout2000/tauview"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/sprout2000/tauview/v${pkgver}/LICENSE.md"
)
sha256sums=('2dd5267e6ea37577f7388d20bd74573b4632310e37992c123dacdede70526275'
            'b68cbd15f8aa5af28a19a93bf42d55e909d5ef19570af1855a6c6d4d41645db9')
prepare() {
    sed -i -e "
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
        s/Categories=/Categories=Graphics;/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}