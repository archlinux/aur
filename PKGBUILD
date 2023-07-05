# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatall-bin"
pkgver=1.29.43
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, bard, Alpaca, Vincuna, Claude, ChatGLM, MOSS, iFlytek Spark, ERNIE and more, discover the best answers"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://chatall.ai/"
_githuburl="https://github.com/sunner/ChatALL"
license=('Apache')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('electron')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('90bb17f6b9cd0f7cad52915c225a3ea977a6bc37a75041dbdec55664038409c3')
sha256sums_aarch64=('055e66bbfb88084d6368a160f6539dcd45597a265c840db6fbdc0004e6bdf047')
sha256sums_armv7h=('055e66bbfb88084d6368a160f6539dcd45597a265c840db6fbdc0004e6bdf047')
sha256sums_x86_64=('d0a19ecca9e86ae2a725ae5eb19e5cae4d1ffd825ec3dfcde5fab32d5d8856d3')
prepare() {
    chmod a+x "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=AppRun --no-sandbox %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}