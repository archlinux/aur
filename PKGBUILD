# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="imagine-appimage"
pkgver=0.7.4
pkgrel=2
pkgdesc="PNG/JPEG optimization app"
arch=("x86_64")
url="https://github.com/meowtec/Imagine"
license=('MIT')
depends=('zlib' 'glibc')
options=(!strip)
provides=(meowtec)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Imagine-${pkgver}.AppImage"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('9f4cce8ac273c215a77af1762103f2a316e08b0c7d9cbe1e94f6c57249a7a983'
            'aebee0e853c4db64ce36bd0b235613a9b948036a7f62af387f2e0b406cd657b7')
        
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/imagine.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}