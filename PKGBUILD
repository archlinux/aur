# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=habit_tracker
pkgname="${_appname//_/-}-bin"
_pkgname=HabitTracker
pkgver=0.0.5
pkgrel=6
pkgdesc="Cross platform habit tracker"
arch=('x86_64')
url="https://github.com/accountability-tracker/habit_tracker"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/accountability-tracker/habit_tracker/v${pkgver}/assets/icon/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('f3410365ea1b1b96a2778df526509c983af8bea0e7502dc9d2ff146cff3f8cc4'
            '90c1ffebcd4b680811b4ded5aaedccd21b1b5d86b79144584c979815940a0f0f'
            'ac9e73f37ffc74e76f343c9c8b5221b67e14dd372741c9df6d49101446ae4f8f')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${_appname//_/-}-bin" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_appname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/"{data,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}