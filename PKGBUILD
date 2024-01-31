# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lettura-bin
_pkgname=lettura
pkgver=0.1.15
pkgrel=1
pkgdesc="Another free and open-source feed reader"
arch=('x86_64')
url="https://github.com/zhanglun/lettura"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'gtk3'
    'openssl-1.1'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/zhanglun/lettura/v${pkgver//_/-}/docs/LICENSE"
)
sha256sums=('cec380ff04f9579ccbbc0be63e78e9aa9d68cb0be99634d8bec206f8608a573e'
            'cb0e47679b2552a19d61430fbc452636d7e227b799ed7093d5c13e01798d091b')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}