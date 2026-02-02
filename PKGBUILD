# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=supersonic
pkgname="${_appname}-desktop-bin"
_pkgname=Supersonic
pkgver=0.20.1
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
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64-libmpv2.tar.xz")
sha256sums=('224983b96499874841102fa834d7fca7292c5217dc9df62e5108bf1f0fba8f13')
prepare() {
    sed -i -e "
        s/Exec=${_appname}/Exec=${pkgname%-bin}/g
        s/Icon=/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/local/share/applications/.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/local/share/applications/.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/local/share/pixmaps/.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}