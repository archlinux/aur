# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="uyou-todo-appimage"
_pkgname="uyoutodo"
pkgver=1.3.2
pkgrel=1
pkgdesc="This is a todo list with electron"
arch=('x86_64')
url="https://github.com/tonylu110/uyou-todo-electron"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/uyou.ToDo-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/tonylu110/uyou-todo-electron/main/LICENSE")
sha256sums=('0a86e167ddea0fe74f36443556e40a9974ce3a836eb6543add01e0ca593cd3ea'
            '39db5a38eec57377569ab296b6a804062b8e7a72908db228ae1d6d91bcbb61d3')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_pkgname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/uyoutodo.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}