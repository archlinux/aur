# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kaas-bin
_pkgname=Kaas
pkgver=1.0.5
pkgrel=1
pkgdesc="Cross-platform desktop LLM client for OpenAI ChatGPT, Anthropic Claude, Microsoft Azure and more, with a focus on privacy and security."
arch=("x86_64")
url="https://github.com/0xfrankz/Kaas"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'openssl-1.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgname%-bin}-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/0xfrankz/Kaas/${pkgname%-bin}-v${pkgver}/LICENSE"
)
sha256sums=('758de7d8757845f67c367541bf1e34f1ba81f369a133f134b89308be8d0f630c'
            '92369ee89bbdda6b7d05ad8667c9b354ede5d80e2e9ebb2aca2bbb9f156b44e1')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}