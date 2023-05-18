# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tess-appimage"
pkgver=0.6.3
pkgrel=1
pkgdesc="A hackable, simple, rapid and beautiful terminal for the new era of technology."
arch=('x86_64')
url="https://tessapp.dev/discord"
_githuburl="https://github.com/SquitchYT/Tess"
license=('MPL2')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}_${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/SquitchYT/tess/main/LICENSE")
sha256sums=('1331c536773d76c90e582b9f56d94878920dbe19efb0373a0f562733f7ac7c72'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/tess.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}