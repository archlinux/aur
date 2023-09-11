# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatall-bin
_appname=ChatALL
pkgver=1.42.68
pkgrel=1
pkgdesc="Concurrently chat with ChatGPT, Bing Chat, bard, Alpaca, Vincuna, Claude, ChatGLM, MOSS, iFlytek Spark, ERNIE and more, discover the best answers"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://chatall.ai/"
_githuburl="https://github.com/sunner/ChatALL"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('283f9ab0b11bebca2fa4a46d72b9358d7bc6ba2de22de998dc672fb30e3203a8')
sha256sums_aarch64=('320475044fcfdfb03d044e80364d8bea940b788023232ede9a19a457857dafa1')
sha256sums_armv7h=('320475044fcfdfb03d044e80364d8bea940b788023232ede9a19a457857dafa1')
sha256sums_x86_64=('891c58b4db68571864074ea9665f0b08c96a6e6d6d74f908b87e6ca9812c1b09')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}