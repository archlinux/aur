# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=keylight-commander-bin
_pkgname='Keylight Commander'
pkgver=0.0.12
pkgrel=1
pkgdesc="An open-source and cross-platform application for controlling Elgato Key Lights.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/davidchalifoux/keylight-commander"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/davidchalifoux/keylight-commander/v${pkgver}/license.md"
)
sha256sums=('83426ac36f44fad326cf6f34536a72a144f200028b4505403b84805e7496321c'
            '5ba4b4b2157b55db27973486d9547998bbdfdd475e4ebe64701baef09ff160e2')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/app"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}