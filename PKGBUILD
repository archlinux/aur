# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=open-ai-translator-bin
pkgver=0.3.32
pkgrel=1
pkgdesc="基于 ChatGPT API 的划词翻译浏览器插件和跨平台桌面端应用 - Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=('x86_64')
url="https://github.com/openai-translator/openai-translator"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
	"${pkgname%-bin}"
	"openai-translator"
)
depends=(
	'hicolor-icon-theme'
	'gtk3'
	'java-runtime'
	'webkit2gtk-4.1'
	'xdotool'
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('6da8d04c11c41509fe1124cb9fcf53fe9ddaa8e98c24cb88abfaae1a97f1baeb')
build() {
	bsdtar -xf "${srcdir}/data."*
	sed "4i\Comment=${pkgdesc}" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/"*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
	install -Dm755 "${srcdir}/usr/lib/${pkgname%-bin}/resources/bin/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources/bin"
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}