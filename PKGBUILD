# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=supersonic
pkgname="${_appname}-desktop-bin"
_pkgname=Supersonic
pkgver=0.12.0
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers."
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
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64-libmpv1.tar.xz")
sha256sums=('a3c16e87615cdb222f603c7f9dcfc3c430cc0c45059e0709e9027a4f11b807fb')
build() {
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/local/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm755 -d "${pkgdir}/usr/lib"
    ln -s "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
}