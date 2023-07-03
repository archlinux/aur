# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="open-video-downloader-appimage"
pkgver=2.4.10
pkgrel=2
pkgdesc="A cross-platform GUI for youtube-dl made in Electron and node.js"
arch=('x86_64')
url="https://github.com/StefanLobbenmeier/youtube-dl-gui"
license=('AGPL3')
conflicts=("${pkgname%-appimage}" "youtube-dl-gui")
depends=('zlib' 'glibc' 'python-mutagen')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Open-Video-Downloader-${pkgver}.AppImage")
sha256sums=('e99cf7780eebbe74a1e45cbac822f965c7e7299193adce39b37240d75d8e2389')
    
prepare() {
    chmod a+x "${pkgdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${pkgdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|youtube-dl-gui|${pkgname%-appimage}|g;s|X-utility|Utility|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}