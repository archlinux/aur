# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=statusify-bin
_pkgname=Statusify
pkgver=0.0.3
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
    'hicolor-icon-theme'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.linux-${CARCH}.deb"
)
sha256sums=('8bb1f5eb165b0eb26d7a3758dd6602b8f93718109914cd5dc99da832147aedf9')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
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