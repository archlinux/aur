# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rotion-bin
pkgver=1.0.6
pkgrel=2
pkgdesc="An Electron application with React and TypeScript"
arch=('x86_64')
url="https://github.com/Azanniel/rotion-electron-app"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('8bf2e8c081c9ec7c12dd97c55fdc0dd4740e7e9d1e90f52a19d8364c572f239a'
            'bd3243603191d5b6eea72100b22a792e3720f50e184a89f3814b8dc4509cab2a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Rotion/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/Rotion/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/Rotion/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}