# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=authme-bin
pkgver=4.2.0
pkgrel=2
pkgdesc="Simple cross-platform two-factor (2FA) authenticator app for desktop."
arch=('x86_64')
url="https://authme.levminer.com/"
_ghurl="https://github.com/Levminer/authme"
license=('GPL3')
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
sha256sums=('cc9f7a54edfd849dbbf4f89f1a68072a44ec244cb423a9f7c2d1f7997952a44d')
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