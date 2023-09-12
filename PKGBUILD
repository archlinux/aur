# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epherome-bin
_pkgname=Epherome
pkgver=0.7.1
pkgrel=5
pkgdesc="Powerful Minecraft Launcher"
url="https://epherome.com/"
_githuburl="https://github.com/ResetPower/Epherome"
arch=('x86_64')
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.deb"
    "${pkgname%-bin}.sh")
sha256sums=('7dc740a18e73eb11aaa1ef7dad8342857ab043fb81112dac36129a1f895e49a5'
            '11473bfa2ed6789f116a8d75e4e93d98ecfaecaa979d3ec7f777f597c0a512ad')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}