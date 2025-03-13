# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=typability-bin
_pkgname=Typability
pkgver=0.4.1
pkgrel=1
pkgdesc="a WYSIWYG markdown editor based on Milkdown.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/SimonShiki/Typability"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/SimonShiki/Typability/${pkgver}/LICENSE"
)
sha256sums=('ed3ef9f8cfa6fa5171475e3442f74357be50221c6d6cd28a537682db6218142b'
            '67b6b14d7e8b18212189e42a64ff5c36a6668d92edb0b1bc267adec316e6b6ab')
prepare() {
    sed -i "s/Comment=/Comment=${pkgdesc}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}