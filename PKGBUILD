# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatall-bin"
pkgver=1.37.53
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, bard, Alpaca, Vincuna, Claude, ChatGLM, MOSS, iFlytek Spark, ERNIE and more, discover the best answers"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://chatall.ai/"
_githuburl="https://github.com/sunner/ChatALL"
license=('Apache')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('electron25' 'bash')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/ChatALL-${pkgver}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('283f9ab0b11bebca2fa4a46d72b9358d7bc6ba2de22de998dc672fb30e3203a8')
sha256sums_aarch64=('e4ee0edc0ad83e5f1b4b7ec8c5c441c8fb9e20d5e0788a1bf12855db66c36c05')
sha256sums_armv7h=('e4ee0edc0ad83e5f1b4b7ec8c5c441c8fb9e20d5e0788a1bf12855db66c36c05')
sha256sums_x86_64=('4c552522044e8ad61c9e75dccf921c53b66fd7877f2829309986004687c80842')
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