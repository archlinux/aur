# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server
pkgver=1.2.9
pkgrel=1
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron."
arch=("any")
url="https://simplewebserver.org/"
_githuburl="https://github.com/terreng/simple-web-server"
license=('MIT')
conflits=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('512f44ef4415b6ff53d094137df3e0dd6c0437c2d584966ab719b5b5a6082eaf'
            'd2ebb64421b18a164334e07e7deb612d2d6e2838114df016d65294cc2d53f1f2')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --force
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