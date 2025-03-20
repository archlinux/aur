# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-me-bin
_pkgname=TinyMe
pkgver=0.6.0
pkgrel=1
pkgdesc="An image compress tool using tauri and ffmpeg (Prebuilt version)"
arch=('x86_64')
url="https://github.com/li2go/tiny-me"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'ffmpeg'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/li2go/tiny-me/v${pkgver}/LICENSE"
)
sha256sums=('99a2184a9ba2f224515ded40a6a7d2a36bc8e22b6580782262cf7ca2fe2ee33c'
            'cf9ce33ebe38b6c30c0fafc1769071b4b00c260f605a9d3bc33ec6d3e6629e60')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Graphics;/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}