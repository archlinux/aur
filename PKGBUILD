# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kanbanflow-app-bin
_appname=KanbanFlow-App
pkgver=1.0.0_beta.4
pkgrel=2
pkgdesc="A standalone application for Kanbanflow.com"
arch=('x86_64')
url="https://github.com/metawave/kanbanflow-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_appname}-${pkgver//_/-}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/metawave/kanbanflow-app/v${pkgver//_/-}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('a8146d290fdf4d9e4e62b4fa57fab35bf6db21aa43876bc685a0bdca4bd4ebba'
            '4dcd2e7fe6343b8c84f2996f9713c67ee8e917c8e3606ce9ec221279ac5bfc26'
            '91426896abb23638c7610666af93b9d1aa86874bbbe9e97d067f9d565f5f3680')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}