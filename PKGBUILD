# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=advanced-passgen-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="Advanced Password Generator"
arch=('x86_64')
url="https://codedead.com/software/advanced-passgen"
_ghurl="https://github.com/CodeDead/Advanced-PassGen"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('3957e773990e17c4cc1ce887dc059906b648025dc7c65ed87898e8a58fb353ec')
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