# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: 7k5x <7k5xlp0onfire@gmail.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
pkgname=headset-bin
pkgver=4.2.1
pkgrel=3
pkgdesc="An Electron-based music player for the busy ones"
arch=(x86_64)
url="https://headsetapp.co/"
_githuburl="https://github.com/headsetapp/headset-electron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron14' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com//headsetapp/headset-electron/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f3582c22aef8b2081ab84ea0f2933acf4e4a4e6b1b7b8f4265af5a450103c0ca'
            '0fd4183b7556b9f1b93d974969bad60053ab01db10ed2b501d26ed6840766045'
            '67071d650ece8ea50e82c24b42597a7a9030576361f187d103d8076b3e205091')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}//usr/lib/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}