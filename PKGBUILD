# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-bin
_pkgname=DeltaChat
pkgver=1.41.4
pkgrel=1
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://delta.chat/"
_ghurl="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
provides=(
    "${pkgname%-desktop-bin}=${pkgver}"
    "${pkgname%-bin}=${pkgver}"
)
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
    'hicolor-icon-theme'
    'python-yaml'
    'python>=3'
    'python-importlib-metadata'
    'python-setuptools'
    'python-wheel'
    'python-cffi'
    'python-requests'
    'python-pluggy'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::https://download.delta.chat/desktop/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
    "${pkgname%-bin}.sh"
)
sha256sums=('28f1df7647a8c323b3273cda9fbbae881dd04e9996ce14f29d4d40e9709b65ef'
            '03c891ec47df246c3bce1480ffa8425ac633d291d05b5c05c47b0d1f1f5f2dcc')
build() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}