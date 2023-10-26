# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=knowte-bin
_pkgname=Knowte
pkgver=3.0.0
pkgrel=1
pkgdesc="A note taking application that allows you to quickly and easily organize and find your notes."
arch=('x86_64')
url="https://github.com/digimezzo/knowte"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron17'
    'hicolor-icon-theme'
)
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('6f7ad45262020e24c66536d627442b27601109d434e0d5870de2d48519fe2750'
            '4e0dab5e13e4673f344daec0c791702767db3c7a1545dff5355baef378112224')
build() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/LICENSE" -t "${pkgdir}/usr/share/licenses"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}