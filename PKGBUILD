# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zebar-bin
_pkgname=Zebar
pkgver=3.1.1
pkgrel=1
pkgdesc="A tool for creating customizable and cross-platform taskbars, desktop widgets, and popups.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/glzr-io/zebar"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-opt4-x64.deb"
)
sha256sums=('cba5c8f8deb38d5838f15ce017a17dd5b518ee2e32a5584bd9206c272bba4567')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}