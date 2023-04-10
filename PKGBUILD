# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="esearch-appimage"
pkgver=1.10.0
pkgrel=1
pkgdesc="截屏 离线OCR 搜索翻译 以图搜图 贴图 录屏 滚动截屏 Screenshot OCR search translate search for picture paste the picture on the screen screen recorder"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
optdepends=()
options=(!strip)
provides=("xushengfeng")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/eSearch-${pkgver}-linux-x86_64.AppImage")
sha256sums=('4b44b0c9e7a61ffc765a8fabcd1bceceb3359461537b2231adf107c7ebb04292')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/esearch.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}