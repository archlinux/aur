# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="uyou-todo-appimage"
pkgver=1.3.1
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
sha256sums=('31bfe94e62c5000ea1a8f41f62c28b111b94c11afee45c9fe659c6b488e789a0'
            '39db5a38eec57377569ab296b6a804062b8e7a72908db228ae1d6d91bcbb61d3')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/uyou-todo.AppImage|g;s|uyoutodo|uyou-todo|g' -i "${srcdir}/squashfs-root/uyoutodo.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/uyoutodo.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/uyoutodo.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}