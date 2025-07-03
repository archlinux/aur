# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=piano-trainer-bin
_pkgname='Piano Trainer'
pkgver=1.3.0
pkgrel=1
pkgdesc="Memorize piano scales with ease! A piano practice program w/ MIDI support. Consider it an interactive reference manual 🎹.(Prebuilt version)"
arch=('x86_64')
url="hhttps://zaneh.itch.io/piano-trainer"
_ghurl="https://github.com/ZaneH/piano-trainer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/app-v${pkgver}/${_pkgname// /.}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/ZaneH/piano-trainer/app-v${pkgver}/LICENSE.md"
)
sha256sums=('5be653b591a79dbd7a1cb74fd5fde5b24b08626cbef41d097cfc8fd72dac4449'
            '9ee23e6aeb912ca1dfaec2ea622574c59e3bd279ccf6af59d96fdd4a326ad289')
prepare() {
    sed -i -e "
        s/Exec=\"${_pkgname}\"/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
