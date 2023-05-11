# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-appimage
_appname=Monokle
pkgver=2.1.0
pkgrel=2
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
sha256sums=('d4fa99d901ca3b3e0a1d806811e2cab7447ea5d50bda62e17d58ee455cd6b9e7'
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