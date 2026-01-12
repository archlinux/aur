# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=supersonic
pkgname="${_appname}-desktop-bin"
_pkgname=Supersonic
pkgver=0.20.0
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libglvnd'
    'libx11'
    'mpv'
)
makedepends=(
    'gendesk'
)
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64-libmpv2.tar.xz")
sha256sums=('b45816899c93ffd9184e7984c7eba78b7992d7429ebcc6ba47848fd0ca8826ee')
prepare() {
    gendesk -f -n -q \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${_appname}/usr/local/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}/usr/local/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
