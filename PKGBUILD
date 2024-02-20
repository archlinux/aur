# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goovpn-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Cross-platform gui (use wails) openvpn client."
arch=('x86_64')
url="https://github.com/Vai3soh/goovpn"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'openssl'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('fd114f121a5a417ca3b12090d47214b7de013d26c4f6f61316dd9f9f29144b53')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/usr/sbin/${pkgname%-bin}" -t "${pkgdir}/usr/sbin"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}