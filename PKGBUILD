# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="vigad-appimage"
pkgver=1.0.0
pkgrel=1
pkgdesc="Extract live-data from your screen."
arch=("x86_64")
url="https://vigad.wordpress.com/"
_githuburl="https://github.com/VisualGameData/VIGAD"
license=("MIT")
depends=('zlib' 'glibc')
options=('!strip')
conflicts=("${pkgname%-appimage}-bin")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Vigad-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/VisualGameData/VIGAD/main/LICENSE")
sha256sums=('bd5a3dd6607f23236e376ab32b4ee01957e9816690808b078c707a865eb56b88'
            'a987d5add58c58a7d976130c1fa78f6ddace5f5cdb2c1bac8cc6dbdb8e54376d')
        
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}