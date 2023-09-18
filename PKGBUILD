# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastdownloader-bin
_appname="Fast Downloader"
pkgver=0.5.13
pkgrel=4
pkgdesc="A fast video/audio downloader in electron.js"
arch=('x86_64')
url="https://github.com/BERNARDO31P/FastDownloader"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26-bin' 'glibc>=2.38')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('164c2e51c300b784f3f0d91022676daadbcd266668355acbcc39c5293d993486'
            '354757130c32fd8c2239c2fe14805bb289fee51265a80bfc27e5e6aa4b6f4aaa')
prepare() {
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/"*_linux -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/icons/"* -t "${pkgdir}/opt/${pkgname%-bin}/icons"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}