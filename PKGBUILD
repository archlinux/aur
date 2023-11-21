# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastdownloader-bin
_appname="Fast Downloader"
pkgver=0.5.14
pkgrel=2
pkgdesc="A fast video/audio downloader in electron.js"
arch=('x86_64')
url="https://github.com/BERNARDO31P/FastDownloader"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26-bin'
    'glibc>=2.38'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh"
)
sha256sums=('ebeb09336480b74091edb18134951fcd4357a2e381c3510e97e55ef5fbf6e0fa'
            '23fc4d2d022710b918196a7fecef64a3d19698d840bc32d6d9fb70f695d7b0a4')
build() {
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/"*_linux -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/icons/"*.png -t "${pkgdir}/opt/${pkgname%-bin}/icons"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}