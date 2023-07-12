# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatall-bin"
pkgver=1.32.48
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, bard, Alpaca, Vincuna, Claude, ChatGLM, MOSS, iFlytek Spark, ERNIE and more, discover the best answers"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://chatall.ai/"
_githuburl="https://github.com/sunner/ChatALL"
license=('Apache')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('electron25')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('5bf321fff4a394c3ea964246756a962f2807d232179f9a57155aa9f47f2e995d')
sha256sums_aarch64=('b9c6174369d49c0dd0cc21ec7aaf4f379a0b30e3ec1d349ade1f3995bdc07c4a')
sha256sums_armv7h=('b9c6174369d49c0dd0cc21ec7aaf4f379a0b30e3ec1d349ade1f3995bdc07c4a')
sha256sums_x86_64=('e9b04945bd8d4414ceb839c943efa811a932374bb1a957c6663befb70edee9b9')
prepare() {
    chmod a+x "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}