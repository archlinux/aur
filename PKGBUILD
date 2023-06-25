# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webcord-appimage
pkgver=4.3.0
pkgrel=1
pkgdesc="A Discord and SpaceBar electron-based client implemented without Discord API."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/WebCord-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${url}/releases/download/v${pkgver}/WebCord-${pkgver}-armv7l.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/WebCord-${pkgver}-x64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/SpacingBat3/WebCord/master/LICENSE")
sha256sums=('7e8ddf98c883358508999fe6c1296b44353e624f8a4f7b6754fcfcc9aafa4456')
sha256sums_aarch64=('74eaec4f8ccd540d56851734c45b6a6fe279894da41b474d47cffb11b19bf8f4')
sha256sums_armv7h=('f5de8b79dfdd5122a17a4b667b1f2cbe2bccde12d1a9a4ff828e2c4d57569eab')
sha256sums_x86_64=('0749fd2551673191d33dd56c3eb963288d560661c61f2abcae66826c08bd903b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/WebCord.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/WebCord.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}