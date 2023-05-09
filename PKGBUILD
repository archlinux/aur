# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webcord-appimage
pkgver=4.2.0
pkgrel=1
pkgdesc="A Discord and SpaceBar electron-based client implemented without Discord API."
arch=('x86_64')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/WebCord-${pkgver}-x64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/SpacingBat3/WebCord/master/LICENSE")
sha256sums=('c64a7975a8403942e936dcb18e2f288cccbb194144fdd0de0f377631b060f291'
            '7e8ddf98c883358508999fe6c1296b44353e624f8a4f7b6754fcfcc9aafa4456')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=webcord|Exec=/opt/appimages/webcord.AppImage|g' -i "${srcdir}/squashfs-root/WebCord.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/WebCord.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}