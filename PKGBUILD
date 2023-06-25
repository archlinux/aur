# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname="vieb-appimage"
pkgver=10.1.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=("aarch64" "armv7h" "x86_64")
url="https://vieb.dev/"
_githuburl="https://github.com/Jelmerro/Vieb"
license=("GPL3")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/${pkgver}/Vieb-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/${pkgver}/Vieb-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/${pkgver}/Vieb-${pkgver}.AppImage")
sha256sums_aarch64=('283b97e56972f1fcd4a4a72a2e10b7f42164d9c112ceef7455c9f3072a77b143')
sha256sums_armv7h=('283b97e56972f1fcd4a4a72a2e10b7f42164d9c112ceef7455c9f3072a77b143')
sha256sums_x86_64=('561cfffb98f2853cdafe32d2e3c0196b9dbfa84be89071d4fa07729e414b3d47')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}