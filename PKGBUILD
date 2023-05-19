# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="brs-emu-app-appimage"
pkgver=0.9.0
pkgrel=1
pkgdesc="BrightScript Emulator - Runs on modern browsers and Electron applications."
arch=('x86_64')
url="https://lvcabral.com/brs/"
_githuburl="https://github.com/lvcabral/brs-emu"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}-emu/brsEmuApp-${pkgver}-linux-${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/lvcabral/brs-emu/master/LICENSE")
sha256sums=('e4f4a9cdcc638a061cb75ed794b36a19331b23842fad68549c4de629fc2f3d06'
            '8392b4cdd36bab1f7cdd05978b9320313c54be73cce1fc78268bf84035af5fa6')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/brs-emu-app.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}