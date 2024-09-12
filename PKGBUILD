# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=key-echo-bin
_pkgname=KeyEcho
pkgver=0.0.5
pkgrel=1
pkgdesc="Listen to Mechanical Keyboard Sounds with Every Keystroke - It's Fast."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/ZacharyL2/KeyEcho"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'alsa-lib'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('85e33ddb9cc3e1afe28b7c86b8db0dc534fccc2b527c26eb10344702b24fb857')
sha256sums_armv7h=('b5593b649cc40fe1ac638549f0223b94bc16f920c7042d20d5c3276d676b0f9c')
sha256sums_x86_64=('5b20be5dc4a630e11d2dcd89619217d6b5a758d3478ef3957dde6bd6bfbf13af')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}