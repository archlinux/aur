# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=supersonic
pkgname="${_appname}-desktop-bin"
_pkgname=Supersonic
pkgver=0.22.1
pkgrel=2
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/supersonic-app/supersonic"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libglvnd'
    'libx11'
    'mpv'
)
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64-libmpv2.tar.xz")
sha256sums=('0d41f6b361773e966a53af34d375d1ed6ae90fdbfac652357fc8c03c2a432ce4')
prepare() {
    sed -i -e "
        s/Exec=${_appname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/${_appname}/usr/local/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_appname}/usr/local/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}/usr/local/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${_appname}/usr/local/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
