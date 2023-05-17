# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-appimage
_appname=Monokle
pkgver=2.1.1
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('x86_64')
uarl="https://monokle.io/"
_githuburl="https://github.com/kubeshop/monokle"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/kubeshop/monokle/main/LICENSE")
sha256sums=('9a84ebbdc03e50c59bf68fdd47e541e1804a715bf4df867437178d00bbcd302c'
            '7a89ae90e9c88d5de936743c0432f43051d79d286aff3c4e669b2b3252b84528')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/monokle.AppImage|g;s|Icon=Monokle|Icon=monokle|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}