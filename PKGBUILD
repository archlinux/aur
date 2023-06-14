# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xbyyunpan-appimage"
pkgver=3.11.12
pkgrel=1
pkgdesc="小白羊网盘 - Powered by 阿里云盘Open"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/gaozhangmin/aliyunpan"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}" "aliyunpan-liupan1890" "aliyunpan-odomu")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/XBYDriver-${pkgver}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${url}/releases/download/${pkgver}/XBYDriver-${pkgver}-linux-armv7l.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/XBYDriver-${pkgver}-linux-x86_64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/main/LICENSE")
sha256sums=('37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009')
sha256sums_aarch64=('74c3c276b1655470bd345f4b46c3d7ec3246adaef61e6531d24374e3c481b68b')
sha256sums_armv7h=('e4f7e538734e2462aef98d803e898279bb487b6cd106b615878e985308f1c269')
sha256sums_x86_64=('fdbac73a7c688411a0c58c57317622bbf535d3541ab2aa4c130f0e24c6448797')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}