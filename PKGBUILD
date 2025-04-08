# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epherome-bin
_pkgname=Epherome
pkgver=1.0.0_5
pkgrel=1
pkgdesc="Powerful Minecraft Launcher.(Prebuilt version)"
url="https://epherome.com/"
_ghurl="https://github.com/ResetPower/Epherome"
arch=('x86_64')
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'libsoup'
    'openssl-1.1'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb")
sha256sums=('038dbf77d61b593f86cb16f19b8c1e1305ee308b3dbb6c9e83e66777be7160cf')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Game;/g
        s/Comment=${_pkgname}/Comment=${pkgdesc}/g
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