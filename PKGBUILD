# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=this-week-bin
_pkgname=ThisWeek
pkgver=0.0.14
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
    'webkit2gtk'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/thisweek-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jeot/thisweek/thisweek-v${pkgver}/LICENSE"
)
sha256sums=('ab31fc63be4bb16cecc8f143920e59b14538f00ea76c20b7040164e881aff9af'
            '326a66d4f47b8a692ae544d0b7fd66ddb38f3c1ddd73d690ed3ae8e8b6a144c3')
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
