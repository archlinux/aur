# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="kanbanflow-app-appimage"
pkgver=1.0.0beta.4
_pkgver=1.0.0-beta.4
pkgrel=1
pkgdesc="A standalone application for Kanbanflow.com"
arch=('x86_64')
url="https://github.com/metawave/kanbanflow-app"
license=('MIT')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${_pkgver}/KanbanFlow-App-${_pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/metawave/kanbanflow-app/master/LICENSE.md")
sha256sums=('a8146d290fdf4d9e4e62b4fa57fab35bf6db21aa43876bc685a0bdca4bd4ebba'
            '4dcd2e7fe6343b8c84f2996f9713c67ee8e917c8e3606ce9ec221279ac5bfc26')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/kanbanflow-app.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
       
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}