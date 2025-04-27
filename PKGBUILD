# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thisweek-bin
_pkgname=ThisWeek
pkgver=0.2.0
pkgrel=1
pkgdesc="Weekly task-management desktop app designed to help you organize, track, and achieve your goals and objectives with an intuitive weekly/yearly calendar interface.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/jeot/thisweek"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgname%-bin}-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jeot/thisweek/thisweek-v${pkgver}/LICENSE"
)
sha256sums=('a4095f195f69342a6d1d9ac6fe6c55eb9cd35ed1cac03fb198984e6ef069c476'
            '326a66d4f47b8a692ae544d0b7fd66ddb38f3c1ddd73d690ed3ae8e8b6a144c3')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}