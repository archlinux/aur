# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatall-bin
_appname=ChatALL
pkgver=1.50.74
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, bard, Alpaca, Vincuna, Claude, ChatGLM, MOSS, iFlytek Spark, ERNIE and more, discover the best answers"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://chatall.ai/"
_githuburl="https://github.com/sunner/ChatALL"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('1d7865c7b89027cdb88dccd92797b2d5a30b9d1a02a8b31b63356b8f85f163c7')
sha256sums_aarch64=('8ec4a3aa1c5585859a22c4e16a784c763dda6a84b77c0304c3099aba8df2b04d')
sha256sums_armv7h=('8ec4a3aa1c5585859a22c4e16a784c763dda6a84b77c0304c3099aba8df2b04d')
sha256sums_x86_64=('f155dace2da85ee9c8814cbcd09b60397978ec0be8a55bca7513de02c8582156')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}