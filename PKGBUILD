# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=supersonic
pkgname="${_appname}-desktop-bin"
_pkgname=Supersonic
pkgver=0.8.2
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers."
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
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
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.xz")
sha256sums=('37ee57547eeae13a1c79f3cf767a42ac6dc5b5dfad6e02e15f6563043edc9f36')
build() {
    gendesk -f -n -q --pkgname="${_appname}-desktop-bin" --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${_appname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/local/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm755 -d "${pkgdir}/usr/lib"
    ln -s "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
}