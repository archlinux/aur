# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=des-talk-bin
pkgver=0.1.2
pkgrel=3
pkgdesc="A ChatGPT clone for desktop made with Tauri and React.js"
arch=('x86_64')
url="https://github.com/Red-Spaces/DesTalk"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "destalk")
depends=(
    'hicolor-icon-theme'
    'gtk3'
    'pango'
    'webkit2gtk'
    'gdk-pixbuf2'
    'libsoup'
    'cairo'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Red-Spaces/DesTalk/v${pkgver}/LICENSE"
)
sha256sums=('7ea8c24dfb47a1f10e09eb2cb0e6cb33d51192b9f4a2ddcda38d469030e7166c'
            '9f0d47ac26c0c5a6780c541ad8a392ec796c9933abf93260595ed641d8e623f2')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}