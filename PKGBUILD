# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=felida-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A lightweight Chromium Browser using Electron.js!"
arch=("x86_64")
url="https://github.com/raluvy95/FelidaBrowser"
license=('GPL3')
conflits=("${pkgname%-bin}")
depends=('electron24')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Felida.Browser-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('9bd0aa2b9f06f0a9088837834afc3bce0ac3a748b6fd0e0f47590d5d2c20242b'
            '6a4d2eddfcf43b142bd213706c63813147ae567f5693e69c8036609bfaf38f6d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}