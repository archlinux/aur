# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="zxinfo-file-browser-appimage"
pkgver=1.2.2
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
sha256sums=('4485c4ceb88c8a48ffb5584b6f9c4e2f8987074c0fbe53be9f5c1256abba9aa1'
            '20601ac9c5fef78c9428d16ab2fd5cd072c04e84312f96deae51f06b530be52d')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}