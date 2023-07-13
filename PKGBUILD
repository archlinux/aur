# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="f1mv-lights-integration-bin"
pkgver=2.2.1
pkgrel=1
pkgdesc="The best way to connect your smart home lights to MultiViewer."
arch=('x86_64')
url="https://f1mvli.jstt.me/"
_githuburl="https://github.com/JustJoostNL/F1MV-Lights-Integration"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('electron23')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/F1MV-Lights-Integration-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('411e7360e404029e27612637f056b466355b643ab536f76291499e1f8a412be6'
            'f388b96b41fa1da16f73996f7320bc03f749b6f742d33619c5a7fd1fb120cb79')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}