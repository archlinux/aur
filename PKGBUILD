# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=filesync-bin
_pkgname=FIleSync
pkgver=0.7.16
pkgrel=2
pkgdesc="Quickly and securely share files from Windows, Linux, Mac to Android devices using wifi.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/opeolluwa/filesync"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/opeolluwa/filesync/app-v${pkgver}/LICENSE"
)
sha256sums=('db067928f37f9e6815b94a301324272182bc72e92f354eef7827b56814ddfec4'
            '8b160817fed7132605e826523638a2040590301f6f5fe9784275f70c34d8be67')
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