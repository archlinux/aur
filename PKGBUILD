# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shellzilla-bin
_pkgname=Shellzilla
pkgver=1.1.2
pkgrel=1
pkgdesc="IoT Facility Management Console.(Prebuilt version)IOT设备管理控制台"
arch=('x86_64')
url="https://github.com/mengdemao/shellzilla"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('e05bcfd4869c893c3801c79a441e45b51fc268602b67b96b446e433bb8c3acae')
prepare() {
    sed -i -e "
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
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
}