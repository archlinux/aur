# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyricistant-appimage
pkgver=3.1.1
pkgrel=1
pkgdesc="A helpful writing assistant for lyricists!"
arch=('aarch64' 'x86_64')
url="https://github.com/wardellbagby/lyricistant"
license=('GPL3')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-linux_arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-linux_x86_64.AppImage")
sha256sums_aarch64=('02290e2bcbe18a32888646832b1a3eaa1fdd0ad72bacc2da0dc3340e2922f894')
sha256sums_x86_64=('6b5a061b92f67ef68f951854bc046e4aa5c5e583d5ed2ee6ac8e005e33cf196a')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
  for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
  done
}