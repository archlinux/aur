# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-utils-bin
pkgver=3.3.0
pkgrel=6
pkgdesc="Electron Utils for every day usage as a dev."
arch=('x86_64')
url='https://github.com/SamTV12345/DevRustPilot'
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gtk3'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_0.0.0_amd64.deb"
)
sha256sums=('293213097856719ed5265a6d29783748c0da844b063eed0ab7314767e063e349')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}