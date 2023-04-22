# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gridea-appimage"
pkgver=0.9.3
pkgrel=3
pkgdesc="A static blog writing client (一个静态博客写作客户端)"
arch=("x86_64")
url="https://open.gridea.dev/"
_githuburl="https://github.com/getgridea/gridea"
license=('MIT')
depends=('zlib' 'glibc')
options=(!strip)
optdepends=()
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Gridea-${pkgver}.AppImage"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('9538866b640e44e9fd54bc1b3a957d1625648f1c1dd6b942dcd73d22701ede4e'
            'd5fd1669066ffaab84a9063cd2792ded7aca1f6f92a972f58ffb5173404b53d2')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/gridea.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
