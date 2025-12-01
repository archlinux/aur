# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rgsm-bin
_pkgname=Game-save-manager
_appname=RGSM
pkgver=1.6.0
pkgrel=1
pkgdesc="A simple game save manager.(Prebuilt version)一个简单的游戏存档管理器"
arch=('x86_64')
url="https://help.sworld.club/"
_ghurl="https://github.com/mcthesw/game-save-manager"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'alsa-lib'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('343b19e63615b787c0bc1c8e5855a301c7d55153d22ef307bf8fe111f09bf983')
prepare() {
    sed -i "s/Categories=/Categories=Game;/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
