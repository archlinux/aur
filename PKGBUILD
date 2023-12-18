# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=advanced-passgen-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Advanced Password Generator"
arch=('x86_64')
url="https://codedead.com/software/advanced-passgen"
_ghurl="https://github.com/CodeDead/Advanced-PassGen"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'gdk-pixbuf2'
    'cairo'
    'webkit2gtk'
    'gtk3'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('3c17183e9e3224f6e59d12ed07adc07ace9ac8cf2df9bed9fc1e4ddac75ee0a1')
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