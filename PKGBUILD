# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=swifty-bin
_pkgname=Swifty
pkgver=0.6.13
pkgrel=6
pkgdesc="Free Offline-first Password Manager for MacOS, Windows and Linux."
arch=("x86_64")
url="https://getswifty.pro/"
_githuburl="https://github.com/swiftyapp/swifty"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron23'
)
source=(
    "${pkgname%-bin}-${pkgver}_amd64.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('daa037c75ebc4e6a7b0b835f0efef2d5b1fa7bf4c2c728badbeb16d5f61a3b6a'
            '4049c6f8152e52f2bda29e4e391a4b9dbee2aa54c51e13b2b47a0ec96cb728d8')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
}