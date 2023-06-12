# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="epub-reader-appimage"
_pkgname="Epub-Reader"
_appname="EpubReader"
pkgver=1.0.2
pkgrel=2
pkgdesc="Epub/Book Reader Application built with ElectronJS"
arch=('x86_64')
url="https://mignaway.github.io/epub-reader-website/"
_githuburl="https://github.com/mignaway/${_appname}"
license=('MIT')
depends=('zlib' 'glibc')
makedenpends=('npm' 'gendesk')
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-appimage}.png")
sha256sums=('7a5fb39aa92955eee0dab439b473e462414fcd850fd914c69defcf6bc32cc1be'
            '52c03602fcee0ab80ce0f8350c9c6acd55f1cee270d80fa9e4b6dd30c9d56a19')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${_appname}-${pkgver}/dist/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 "${srcdir}/${_appname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "Utility" --name "${_pkgname}" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}