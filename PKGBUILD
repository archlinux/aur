# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="brs-emu-app-bin"
pkgver=0.10.30
pkgrel=1
pkgdesc="BrightScript Emulator - Runs on modern browsers and Electron applications."
arch=('x86_64')
url="https://lvcabral.com/brs/"
_githuburl="https://github.com/lvcabral/brs-emu-app"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/brsEmuApp-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/lvcabral/brs-emu/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('1a66a4f783af31fa4d9751709c27e6ee3eef2ff39df4417d8568b5676dbf3a42'
            '8392b4cdd36bab1f7cdd05978b9320313c54be73cce1fc78268bf84035af5fa6'
            '6329021a66c0cacbdbb23285dc68df63adc288e1ad79745626f59d8dc019e170')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/BrightScript Emulator/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|\"/opt/BrightScript Emulator/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}