# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=edgetx-buddy-bin
pkgver=0.1.0
pkgrel=4
pkgdesc="The next generation tool for EdgeTX. A cross platform app, with browser compatibility."
arch=('x86_64')
url="https://buddy.edgetx.org/"
_githuburl="https://github.com/EdgeTX/buddy"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/latest/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/EdgeTX/buddy/latest/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ad99eae7482c2a81029e208c9355426d2b67b0fb91157e6ee2aa0b9ccaa3131e'
            'b439e9847dce86ac976ddeb9949eb190c53322569f05f43d1cb4278ef1d90167'
            'c8a7ed61c0141631736eac078d21ad0b7d1ab23cd3b9c638a66d5f92cf61f923')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}