# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=utilso-appimage
pkgver=4.4.0
pkgrel=3
pkgdesc="Regex Tester, JWT Verify, Image Converter, Format JSON, Decode base64, Code Beautify and more.Work completely offline"
arch=("x86_64")
url="https://utilso.com"
license=("custom")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
providers=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://cdn.utilso.com/Utilso-${pkgver}.AppImage"
        "LICENSE.html::${url}/license-agreement")
sha256sums=('3d26f15d7210f805f56d92f2d828844a0a16b789ec7e4f3a4983e50ae7d050cc'
            '82f6b5ef65aaab78d1a4b6ad9f34ff5913beee45f4e346b928c039e3cd734eeb')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/utilso.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}