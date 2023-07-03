# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="znote-appimage"
pkgver=2.3.5
pkgrel=1
pkgdesc="A Beautiful markdown editor inspired by Jupyter."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://znote.io"
_githuburl="https://github.com/alagrede/znote-app"
license=('custom')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
source=("LICENSE.html::${url}/cgu.html")
sha256sums=('7085547bfd2eab7db1d63350989f5b74b1d0104f9713e76e51420fb45f4d967c')
sha256sums_aarch64=('76b173f88124f843f7db92e2be872b528910212ae59bf98c7731a63dccdc4714')
sha256sums_armv7h=('76b173f88124f843f7db92e2be872b528910212ae59bf98c7731a63dccdc4714')
sha256sums_x86_64=('5bbefe4bd8421bc352c066bddf28a7a96be6583298058f8e74b3fb7f7571aeec')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 8x8 32x32 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}