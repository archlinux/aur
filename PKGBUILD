# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reader-project-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="XML based feed reader for your desktop.(Prebuilt version)"
arch=('x86_64')
url="https://rahuldshetty.github.io/reader-project/"
_ghurl="https://github.com/rahuldshetty/reader-project"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/rahuldshetty/reader-project/v${pkgver}/LICENSE"
)
sha256sums=('e90299ec66255d488f1a8bf25da9235b5bd2b31083972b50900b5ed7c1402ec8'
            '84afb780728548ed34cc26b8490d3f84f7753010c7c1eae92141db7c0869fbf5')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}