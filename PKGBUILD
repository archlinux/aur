# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quasar-todo-appimage
pkgver=0.1.2
pkgrel=1
pkgdesc="Playing with Quasar CLI by making a simple to-do list"
arch=('x86_64')
url="https://github.com/spenserblack/quasar-todo"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Quasar-Todo-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/spenserblack/quasar-todo/main/LICENSE")
sha256sums=('842a8ebef866fdc6d6fbd31c48143e776b7949aec3b991446c71cae5105419bb'
            '0cadd467ba2b1f8ad00eb2c55c458c250d6f70a661a0aff1acb905777353c997')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}