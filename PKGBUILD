# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simplenote-appimage
pkgver=2.21.0
pkgrel=1
pkgdesc="A Simplenote React client packaged in Electron."
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://app.simplenote.com/"
_githuburl="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-electron-bin" "python-${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-armv7l.AppImage")
source_i686=("${pkgname%-appimage}-${pkgver}-i686.AppImage::${_githuburl}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-i386.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-x86_64.AppImage")
sha256sums_aarch64=('5eaa38788a3f0a03e316483a2d2d90b8717aeeeeda0a974f7435b61bbbe02566')
sha256sums_armv7h=('0ba5dd4c8b8906e2148ca6a81c7d70358f11ef06a04bc2dc4a0b9a18a9156da6')
sha256sums_i686=('1d11a9d2a1fbfd98389894cee254cf02ed5872779428ceea2c5e70e0536204c8')
sha256sums_x86_64=('d24e6149a262f11e3d2c201acce22f2b21b7a47efefb4370a8b5d122d90ce907')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}