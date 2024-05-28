# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tauview-bin
_pkgname=Tauview
pkgver=0.0.11
pkgrel=1
pkgdesc="Minimalist image viewer based on Leaflet.js and Tauri."
arch=("x86_64")
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
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/sprout2000/tauview/v${pkgver}/LICENSE.md"
)
sha256sums=('2f5949ee933a41642b5805d23caf722357eb09de1bf8f80122b740cba3a0a71d'
            'b68cbd15f8aa5af28a19a93bf42d55e909d5ef19570af1855a6c6d4d41645db9')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|Name=${pkgname%-bin}|Name=${_pkgname}|g;s|Categories=|Categories=Utility;|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}