# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="crankshaft-appimage"
pkgver=1.7.0
pkgrel=1
pkgdesc="A sensible krunker client written in typescript"
arch=('x86_64')
url="https://github.com/KraXen72/crankshaft"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-appimage}-portable-linux-${arch}.AppImage")
sha256sums=('d8843ac48f695d7e6e0e280f3446997395705c04a0514d979297c1e56aa7a9a2')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/crankshaft.AppImage|g;s|game|Game|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}