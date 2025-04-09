# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=authme-bin
_pkgname=Authme
pkgver=6.1.0
pkgrel=1
pkgdesc="Simple cross-platform two-factor (2FA) authenticator app for desktop.(Prebuilt version)"
arch=('x86_64')
url="https://authme.levminer.com/"
_ghurl="https://github.com/Levminer/authme"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb"
)
sha256sums=('8197c655fcd6945a0009d0eb45da7604ab0db720913a7661ea0062dc0ddcf5df')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}