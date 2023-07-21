# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="subtitler-bin"
pkgver=1.5.5
pkgrel=3
pkgdesc="Quickly download subtitles"
arch=("x86_64")
url="https://s8sachin.github.io/subtitler/"
_githuburl="https://github.com/s8sachin/subtitler"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron8')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/s8sachin/subtitler/master/LICENSE"
        "${pkgname%-bin}.sh")
sha256sums=('ca37a8487fcf6283b36adcb43de9ebc4a12d7bd2ab96a73a1695f3c2b4d51f81'
            '910e8030c09f74d9e027c4cd75ad09484e4897c4a92c7114651a188cbaf3a80d'
            '7e8a68cf101bad676f68211861c3c7ea38966bf46e15e8f8e8e047ae0a5ba5a6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Subtitler/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/Subtitler/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}