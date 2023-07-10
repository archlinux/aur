# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="coal-launcher-bin"
_pkgname="Coal Launcher"
pkgver=1.3.1
pkgrel=1
pkgdesc="A client to view and play games from the AB Coal website"
arch=('x86_64')
url="https://bobuxstation.github.io/Coal-Web/launcher.html"
_githuburl="https://github.com/Bobuxstation/Coal-Launcher"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Bobuxstation/Coal-Launcher/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ca0972dcad774d4a34d88155249e7b47908aa80cd5db22b3c7c697904f14491f'
            '0133c8e5890f9f848adde48b40a9c61dcff249ea3c0f5bcf6567901e7a697c49'
            '9441e01d585b1ef61d557a66a6759d8386cd98e7cda071865c9e8ea33a45e86f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=\"/opt/${_pkgname}/${pkgname%-bin}\" %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}