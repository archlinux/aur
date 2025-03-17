# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soulfire-bin
_pkgname=SoulFire
pkgver=1.9.0
pkgrel=1
pkgdesc="A frontend for the SoulFire server. It mainly targets the web, but uses native APIs using Tauri.(Prebuilt version)"
arch=('x86_64')
url="https://app.soulfiremc.com/"
_ghurl="https://github.com/AlexProgrammerDE/SoulFireClient"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('6d0ffb04f5c30db2aa7b54e9d5a585d5b6e45229b3bf3a7c1583a8895f66afc6')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}