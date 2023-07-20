# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server
pkgver=1.2.8
pkgrel=1
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron."
arch=("any")
url="https://simplewebserver.org/"
_githuburl="https://github.com/terreng/simple-web-server"
license=('MIT')
conflits=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('8e3a21e99b126953c792d4700e6d7d20bc7adee46b8ff99d1e595723ac9a184f'
            '834fee7a2ce250369c652dabe1a3c2e8a72f39645bfd3beb267f3e0b932179b9')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/images/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "Simple Web Server" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}