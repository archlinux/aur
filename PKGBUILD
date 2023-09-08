# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tts-now-bin
pkgver=1.0.6
pkgrel=2
pkgdesc="跨平台基于云平台(阿里云、讯飞等)语音合成 API 的文字转语音助手。支持单文本快速合成和批量合成。"
arch=('x86_64')
url="https://tts.yycc.dev/"
_githuburl="https://github.com/funnyzak/tts-now"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-ubuntu-latest-${pkgver}-33ac5a4.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('9539714adc1bf627fd75f00c3c1106ea6573e560ccd6ff015d1818774650c718'
            'ace3513c9f1aab6bfff42cbf02b6c7febf5259fd82574983e5dc6ce7c55a593c')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}