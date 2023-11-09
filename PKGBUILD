# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dialogcraft-bin
_pkgname=Dialogcraft
pkgver=1.0.6
pkgrel=1
pkgdesc="Desktop client for OpenAI GPT API."
arch=('x86_64')
url="https://github.com/Hayden2018/dialogcraft"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libxfixes'
    'cairo'
    'nspr'
    'libdrm'
    'mesa'
    'libxrandr'
    'libxext'
    'libxcomposite'
    'libcups'
    'gtk3'
    'pango'
    'libxdamage'
    'alsa-lib'
    'expat'
    'nss'
    'at-spi2-core'
    'libx11'
    'libxkbcommon'
    'libxcb'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Hayden2018/dialogcraft/v${pkgver}/LICENSE"
)
sha256sums=('82a2923f8d0104dd726952b5b42e3cd62683683489ad1395544adbdb6aa4548e'
            'c09d111b4c731bb0e1771677ef839c4db3f709238e7ed8bbd005d737b01286c8')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}