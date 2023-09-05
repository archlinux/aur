# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chieapp-bin
pkgver=0.2.11
pkgrel=1
pkgdesc="An extensive desktop app for ChatGPT and other LLMs."
arch=('x86_64')
url="https://chie.app/"
_githuburl="https://github.com/chieapp/chie"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('gdk-pixbuf2' 'gtk3' 'webkit2gtk' 'at-spi2-core' 'glib2' 'libsoup' 'pango' 'glibc' 'harfbuzz' 'libx11' 'freetype2' 'fontconfig' 'gcc-libs' 'cairo')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}.desktop")
sha256sums=('4b4271be8438312e3aedc5ca5c9c2f82e406a194df8dfa8c6d4ecfbaca0fe88d'
            'bbeece1fec31f46aecb7354e359acfdb6669403ff4d9186a393a4c36f669f54c')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/res" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/res/assets/icons/icon@2x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}