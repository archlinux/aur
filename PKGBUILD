# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server-appimage
pkgver=1.2.8
pkgrel=1
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron."
arch=("any")
url="https://simplewebserver.org/"
_githuburl="https://github.com/terreng/simple-web-server"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
makedepends=('npm' 'gendesk')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e3a21e99b126953c792d4700e6d7d20bc7adee46b8ff99d1e595723ac9a184f')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    npm install
    npm run make
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}/dist/Simple Web Server-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/${pkgname%-appimage}-${pkgver}/images/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/${pkgname%-appimage}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "Utility" --name "Simple Web Server" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}