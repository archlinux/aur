# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=diffuse
pkgname="${_pkgname}-player-bin"
pkgver=3.3.0
pkgrel=7
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_ghurl="https://github.com/icidasset/diffuse"
license=("custom:PPL2")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'openssl'
    'gtk3'
    'gdk-pixbuf2'
    'pango'
    'cairo'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/icidasset/diffuse/main/LICENSE"
)
sha256sums=('47703b10325b6e4d65960d573b1a6a8b04d992a523ce2b2605aae0ec0522bcd0'
            '22f6e9359127b271eba050bc6e87abc699982ace7a6b386c1c346c7f3154eda8')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1716x1716/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}