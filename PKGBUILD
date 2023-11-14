# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epherome-bin
_pkgname=Epherome
pkgver=0.7.1
pkgrel=6
pkgdesc="Powerful Minecraft Launcher"
url="https://epherome.com/"
_ghurl="https://github.com/ResetPower/Epherome"
arch=('x86_64')
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('7dc740a18e73eb11aaa1ef7dad8342857ab043fb81112dac36129a1f895e49a5'
            '57044c59941da6ee1faf765cca7401fb9d796591c63738e3282d8d05c58dd6b8')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}