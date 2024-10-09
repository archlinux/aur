# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=authme-bin
pkgver=5.3.1
pkgrel=1
pkgdesc="Simple cross-platform two-factor (2FA) authenticator app for desktop.Prebuilt version."
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
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb"
)
sha256sums=('1b9fc096751e6ad10e777e8290466b38ad4c181ed5e3bbb5217825aa4de24d9b')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}