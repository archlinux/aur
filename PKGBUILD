# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="coal-launcher-electron-bin"
_pkgname="Coal Launcher"
pkgver=1.2.8
pkgrel=1
pkgdesc="A client to view and play games from the AB Coal website"
arch=('x86_64')
url="https://bobuxstation.github.io/Coal-Web/launcher.html"
_githuburl="https://github.com/Bobuxstation/Coal-Launcher"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('electron')
source=("${pkgname%-electron-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Bobuxstation/Coal-Launcher/main/LICENSE"
    "${pkgname%-electron-bin}.sh")
sha256sums=('80227cd09d95eb3e421d90dba97ce9a8ac695f7b0ae02f71a02c8a2842ecbcc7'
            '0133c8e5890f9f848adde48b40a9c61dcff249ea3c0f5bcf6567901e7a697c49'
            '9441e01d585b1ef61d557a66a6759d8386cd98e7cda071865c9e8ea33a45e86f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=\"/opt/${_pkgname}/${pkgname%-electron-bin}\" %U|Exec=/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-electron-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-electron-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${pkgname%-electron-bin}.sh" "${pkgdir}/opt/${pkgname%-electron-bin}/${pkgname%-electron-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}