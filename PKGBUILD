# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passmage-bin
_pkgname=Passmage
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple, secure and user-friendly password manager built with Tauri and React.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/matteoauger/passmage"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/matteoauger/passmage/v${pkgver}/LICENSE.md"
)
sha256sums=('976c0e9e1e68447408c9d4029ecce97a42a226e03e8a14f861a911b067ad270b'
            '4ff10653245a6963d0e6a71a87e17742a6c21e038eea4ce9ce6f13710d1fc708')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
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
