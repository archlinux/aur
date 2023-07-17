# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="p3x-onenote-bin"
pkgver=2023.4.119
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.corifeus.com/onenote/"
_githuburl="https://github.com/patrikx3/onenote"
license=('MIT')
depends=('hicolor-icon-theme' 'bash' 'electron')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/patrikx3/onenote/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('28b4989bb7788578e411c2b999f9dbd1487e1202c05f13e77e56974a63f344fd'
            '463b4b4446921fb7eae0762a94d3170d1de9c71f8443575d9d5ab7e43b344104'
            'b993ae302a166eb55f0fdac993e424f5670a7dee2dd2d8c7d8807dac62c9473a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/P3X OneNote/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/P3X OneNote/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}