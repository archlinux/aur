# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=web-os-dev-manager-bin
pkgver=1.12.0
pkgrel=2
pkgdesc="Device/DevMode Manager for webOS TV"
arch=('x86_64')
url="https://github.com/webosbrew/dev-manager-desktop"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'pango'
    'cairo'
    'libsoup'
    'gdk-pixbuf2'
    'webkit2gtk'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('0550497194ae4a6b3f4a67100e12a8b766b03c409a90a4cd47200cd38b4027d3')
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
}