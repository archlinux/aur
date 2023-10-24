# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server-bin
_pkgname=Simple-Web-Server
pkgver=1.2.9
pkgrel=1
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron."
arch=("aarch64" "x86_64")
url="https://simplewebserver.org/"
_githuburl="https://github.com/terreng/simple-web-server"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron26')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/terreng/simple-web-server/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('57e19cef8140644e1f4ac091f5bb90dc20e65f26232a756233cba336c2dbd85b'
            '788d3d637ea520cf592acebec799938a8d6a2a865b135ddf625832e2ec4dfc26')
sha256sums_aarch64=('bfdf4f07b1dbf213d4428ff59f092d22123e7f7a5622f7d03e25b3f0eb5afcf4')
sha256sums_x86_64=('1cafce48d05c1e331785928797db30cc4d1c608c816a9c8beb8250d3c661ca14')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname//-/ }/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}