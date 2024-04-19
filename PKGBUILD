# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Gyara <laxect39@gmail.com>
_pkgname=helio
pkgname="${_pkgname}-workstation-bin"
_appname=Helio
pkgver=3.12
pkgrel=1
pkgdesc="A free and open-source music sequencer for desktop and mobile platforms"
arch=('x86_64')
url="https://helio.fm/"
_ghurl="https://github.com/helio-fm/helio-sequencer"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libcurl-gnutls'
    'alsa-lib'
    'libglvnd'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://ci.helio.fm/${_pkgname}-${pkgver}-x64.deb"
)
sha256sums=('65f02cd4c926e1b4419edc429660bd3848dcfcbdd914b4c4dbb44a189d52f872')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|/usr/bin/${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 128x128 256x256; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}