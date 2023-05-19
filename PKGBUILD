# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tts-now-appimage"
pkgver=1.0.6
pkgrel=1
pkgdesc="跨平台基于云平台(阿里云、讯飞等)语音合成 API 的文字转语音助手。支持单文本快速合成和批量合成。"
arch=('x86_64')
url="https://tts.yycc.dev/"
_githuburl="https://github.com/funnyzak/tts-now"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-ubuntu-latest-${pkgver}-33ac5a4.AppImage")
sha256sums=('9539714adc1bf627fd75f00c3c1106ea6573e560ccd6ff015d1818774650c718')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/tts-now.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}