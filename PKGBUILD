# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="southweather-appimage"
pkgver=1.0.1
pkgrel=1
pkgdesc="Open weather app for linux"
arch=("x86_64")
url="http://southweather.wlorigin.cf/"
_githuburl="https://github.com/SpiritOTHawk-s-projects/SouthWeather"
license=('ISC')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/SouthWeather-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/SpiritOTHawk-s-projects/SouthWeather/master/LICENSE.md")
sha256sums=('44d74cf6b0d85a5f9cd88aab7a2be09d54afb8e097c6463d9979e51715415576'
            'd3c7942b781e1616c13d183bf30ccb1e52837b11d53a7f97ae4b65d85fcd3bac')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}