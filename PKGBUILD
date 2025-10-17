# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rauthy-bin
_pkgname='Rauthy TOTP'
pkgver=0.0.11
pkgrel=1
pkgdesc="An Opensource TOTP (Time-based One-Time Password) app that allow you to manage your 2FA (2 Factor Authentication) tokens. It is like Authy or Google Authenticator.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/charlesschaefer/rauthy-totp"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/app-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('28c9419f45b8ea558ff2a6bd9bd264f7848c428c0b663376055097a068f58ac5')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;System/g
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
