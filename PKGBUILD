# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=piano-trainer-bin
_pkgname='Piano Trainer'
pkgver=1.1.2
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
    'webkit2gtk'
    'libsoup'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/ZaneH/piano-trainer/app-v${pkgver}/LICENSE.md"
)
sha256sums=('c4ecd4813c3d429c95b2e30455c5d2cfb91e0e7a50e414f80f432927d9c81170'
            '9ee23e6aeb912ca1dfaec2ea622574c59e3bd279ccf6af59d96fdd4a326ad289')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}