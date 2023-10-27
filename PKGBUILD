# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rebaslight-bin
_pkgname="Rebaslight"
pkgver=3.7.3
pkgrel=1
pkgdesc="An easy to use special effects editor"
arch=("x86_64")
url="http://www.rebaslight.com/"
_ghurl="https://github.com/rebaslight/rebaslight"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron25'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.bz2"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/rebaslight/rebaslight/v${pkgver}/src/img/logo-transparent-100.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('d322a41100fcacb12658d3cef76ec21070081445d4f8868befa8c8edf267abd0'
            '62c76391a01e5d25c078cd65b2b0c78f39c756d041fef426043abfee38f0697c'
            '7045452f79743a68d66c11d065db619a627e9569250e5b742db3ab48abd412cb')
build() {
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/ffmpeg" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}