# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=popcorn-time
pkgname=popcorn-fx-bin
pkgver=0.7.5
pkgrel=3
pkgdesc="A multi-platform torrent streaming client that includes an integrated media player with support for embedded devices such as the Raspberry PI."
arch=("x86_64")
url="https://github.com/yoep/popcorn-fx"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}" "${_pkgname//_/ }")
depends=(
    'libxtst'
    'libx11'
    'java-runtime'
    'alsa-lib'
    'libxrender'
    'openssl'
    'libxext'
    'libxi'
    'freetype2'
    'dbus'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.deb"
)
sha256sums=('2227434d02ca074764ded5e5d3171ef2bcbde591ab5a38dc022ebb729b981a20')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin}|g;s|/opt/${_pkgname}/${_pkgname}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname%-bin},usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}