# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chaski-bin
_pkgname=Chaski
pkgver=0.5.2
pkgrel=1
pkgdesc="A content aggregator that helps you focus on what matters.(Prebuilt version)"
arch=('x86_64')
url="https://chaski.a-chacon.com"
_ghurl="https://github.com/a-chacon/chaski-app"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/app-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('d2bed30da786baff01901f39551139cee380b74f42b955590d1ec1b544bc1c95')
prepare() {
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
