# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=open-ai-translator-bin
pkgver=0.0.89
pkgrel=1
pkgdesc="基于 ChatGPT API 的划词翻译浏览器插件和跨平台桌面端应用 - Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=('x86_64')
url="https://github.com/openai-translator/openai-translator"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "openai-translator")
depends=('hicolor-icon-theme' 'glibc' 'dbus' 'glib2' 'gcc-libs' 'xdotool' 'gtk3' 'cairo' 'gdk-pixbuf2' \
	'libx11' 'libxtst' 'java-runtime' 'pango' 'webkit2gtk' 'openssl')
source=("${pkgname%-appimage}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('92ccd14283e4766b5a519c37bd8e2ae0ce656b1d38ede3cb02d48881272ddb85')
prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz"
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