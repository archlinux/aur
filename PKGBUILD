# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=authme-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="Simple cross-platform two-factor (2FA) authenticator app for desktop."
arch=('x86_64')
url="https://authme.levminer.com/"
_ghurl="https://github.com/Levminer/authme"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gdk-pixbuf2'
    'gtk3'
    'webkit2gtk'
    'cairo'
    'openssl'
    'libsoup'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb"
)
sha256sums=('8fe5f341fbb100257be1dc5c9b546a0e537ecb1b4aef91fb938c8cd4ecd71c7e')
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