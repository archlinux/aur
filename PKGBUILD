# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=statusify-bin
_pkgname=Statusify
pkgver=0.0.10
pkgrel=1
pkgdesc="Discord rich presence configurator desktop app"
arch=('x86_64')
url="https://github.com/Orphoros/Statusify"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'openssl'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.linux-${CARCH}.deb"
)
sha256sums=('f720d56508cff8ef9baf8cdfe2b84e6fea41b31856883c7ffdb1d8f324d98f2f')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/images/"*.svg -t "${pkgdir}/usr/lib/${pkgname%-bin}/images"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2}/apps"
    done
}