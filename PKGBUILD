# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brs-emu-app-bin
_appname="BrightScript Emulator"
_pkgname=brsEmuApp
pkgver=0.10.31
pkgrel=1
pkgdesc="BrightScript Emulator - Runs on modern browsers and Electron applications."
arch=('x86_64')
url="https://lvcabral.com/brs/"
_githuburl="https://github.com/lvcabral/brs-emu-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron20')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/lvcabral/brs-emu/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('49fe96a56a71fc5e58c185cbcf0a39e3605ee85e836f17d058973b4826a6d568'
            '8392b4cdd36bab1f7cdd05978b9320313c54be73cce1fc78268bf84035af5fa6'
            '8f003b41c55d881b1213c1d62977abb233e7526fc0d839429f1ac9922b991a98')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}