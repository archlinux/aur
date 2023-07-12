# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastdownloader-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="A fast video/audio downloader in electron.js"
arch=('x86_64')
url="https://github.com/BERNARDO31P/FastDownloader"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron25' 'glibc')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('8b246192fc1bf457f09557d75dbe3a144d91dde70ef4660b674bf35a0e9b2115'
            'a72d51b9e0c04769742e7e9dbc4f0ea454c6be994d50ad12d0d33ee3dca858a3')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Fast Downloader/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/Fast Downloader/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/"*linux*
}