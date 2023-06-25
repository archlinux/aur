# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatall-appimage"
pkgver=1.29.37
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, bard, Alpaca, Vincuna, Claude, ChatGLM, MOSS, iFlytek Spark, ERNIE and more, discover the best answers"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://chatall.ai/"
_githuburl="https://github.com/sunner/ChatALL"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-x86_64.AppImage")
sha256sums_aarch64=('1937dc7b8f193d4fab78b6ef4c243777780f3718e31804992911e73461c87bba')
sha256sums_armv7h=('1937dc7b8f193d4fab78b6ef4c243777780f3718e31804992911e73461c87bba')
sha256sums_x86_64=('1b065169a833fa0c7e9b860d31c38b963858d6fef09d4f762998a31299f35a67')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}