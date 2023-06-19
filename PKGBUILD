# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname="webkitty-appimage"
pkgver=3.1.1
pkgrel=2
pkgdesc="Local web development IDE"
arch=("x86_64")
url="https://dartfling.com/product?pid=3"
_githuburl="https://github.com/yikuansun/webkitty"
license=("MIT")
depends=('zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/WebKitty-${pkgver}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/yikuansun/webkitty/master/LICENSE")
sha256sums=('334f7d1319027a3c7d5a4c99a080840768971c0e40738bfd9318022d52fceeb6'
            'c46ac74ef8cd13c7541f9de280f3d759319f70292fd32d4d170193041b06300b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}