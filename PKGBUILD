# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thief-appimage
pkgver=4.0.0
pkgrel=1
pkgdesc="一款创新跨平台摸鱼神器，支持小说、股票、网页、视频、直播、PDF、游戏等摸鱼模式，为上班族打造的上班必备神器，使用此软件可以让上班倍感轻松，远离 ICU"
arch=('x86_64')
url="https://thief.im/"
_githuburl="https://github.com/cteamx/Thief"
license=('GPL3')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}-linux64.AppImage")
sha256sums=('500583196bd45cc23e611abaf113f9733edc3da0361b641171385ba7aaeed4fc')
_install_path="/opt/appimages" 
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/thief.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}