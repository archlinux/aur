# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xbyyunpan-appimage"
pkgver=3.11.11
pkgrel=1
pkgdesc="小白羊网盘 - Powered by 阿里云盘Open"
arch=('x86_64')
url="https://github.com/gaozhangmin/aliyunpan"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}" "aliyunpan-liupan1890" "aliyunpan-odomu")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-${CARCH}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/main/LICENSE")
sha256sums=('0695198319f2d349d62a7785a3ed8ad7e35e6a8ff040ee8575f73526336bed73'
            '37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}