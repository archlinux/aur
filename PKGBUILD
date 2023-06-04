# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="spark-wallet-appimage"
pkgver=0.3.1
pkgrel=1
pkgdesc="A minimalistic wallet GUI for c-lightning, accessible over the web or through mobile and desktop apps."
arch=('x86_64')
url="https://github.com/shesek/spark-wallet"
license=('MIT')
depends=('glibc' 'zlib')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-${CARCH}.AppImage"
  "LICENSE::https://raw.githubusercontent.com/shesek/spark-wallet/master/LICENSE")
sha256sums=('b7aa4b2d2805400243dff66c46313d5155d60081d8cff01a6da3567729032d2c'
            'd8a82e79466ba5d679ba7edf5acd05bf6767edeb56f51a76ce8e121c7c887bf2')
 
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|spark-desktop|${pkgname%-appimage}|g;s|Finance|Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-wallet-appimage}-desktop.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-wallet-appimage}-desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-wallet-appimage}-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}