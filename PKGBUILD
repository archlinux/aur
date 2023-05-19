# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nodeflow-appimage"
_appname="node-flow"
pkgver=0.0.2alpha
_appver=0.0.2-alpha
pkgrel=1
pkgdesc="An Editor for creating simple or complex OCR workflows"
arch=('x86_64')
url="https://github.com/maxnth/NodeFlow"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${_appver}/NodeFlow-${pkgver%alpha}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/maxnth/NodeFlow/master/License")
sha256sums=('fd1bb578d47245a95ba7c206f7f64aa013e56afe2247511dea48e62190d4a545'
            '2fa2313855f0dfa9399163896c8a91747298ae501fb1f915e6a8479dc60f3791')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/nodeflow.AppImage|g;s|node-flow|nodeflow|g;s|Productivity|Productivity;Utility|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}