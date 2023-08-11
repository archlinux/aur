# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatgptx-bin
_appname=ChatGPTx
pkgver=1.0.1
pkgrel=3
pkgdesc="A tray app for ChatGPT. Using this app you can easily access the ChatGPT from your system tray."
arch=('x86_64')
url="https://github.com/florindumitru/chatgpt-desktop-tray"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/florindumitru/chatgpt-desktop-tray/master/license"
    "${pkgname%-bin}.sh")
sha256sums=('569172250abf0aafe7084a81997036f8ba39736912fff463c11fa1f2d8cf5b00'
            'c4b2ddb85db30368f3e6c0ffb7ea3de437c72ea65504c2281cdb929bb920b670'
            '8d49381367203c0cb360b5cb5d551e1f5a4481854dc34fd83525eb631623173d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}