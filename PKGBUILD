# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Chat with your documents using local AI"
arch=('x86_64')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=(
    'bash'
    'electron24'
    'hicolor-icon-theme'
    'libvips'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/chatd-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('065a71170cfa0fe00ed042fec90f0d2d051daa96c488fd66b5060edfb6365508'
            'fcaeb0dbb5ef834b40ae32c177deed39a8a79e280305c6195a84fa70b525b844')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/src/service/ollama/runners/ollama-linux-x64" "${pkgdir}/usr/bin/ollama"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/public/${pkgname%-bin}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644  "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
