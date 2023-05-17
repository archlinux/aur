# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="zxinfo-file-browser-appimage"
pkgver=1.1.6
pkgrel=1
pkgdesc="Organize and manage your emulator files for ZX Spectrum & ZX 81 - powered by the web"
arch=('x86_64')
url="https://github.com/thomasheckmann/zxinfo-file-browser"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/thomasheckmann/zxinfo-file-browser/master/LICENSE")
sha256sums=('5e5aed9d27a91ebd81d238d93dc45399cabc76ba18514b1532c54673da52aecc'
            '2042c6124204156b44ed7676a90f1e0bb9ddfee1f76d20f7b6f220a90398f74e')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/zxinfo-file-browser.AppImage|g;s|/usr/share/icons/hicolor/256x256/apps/zxinfo-file-browser.png|zxinfo-file-browser|g' \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}