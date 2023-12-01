# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=implay-bin
_pkgname=ImPlay
pkgver=1.5.1
pkgrel=1
pkgdesc="Desktop media player built on top of mpv and imgui"
arch=('x86_64')
url="https://tsl0922.github.io/ImPlay"
_ghurl="https://github.com/tsl0922/ImPlay"
license=('GPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'freetype2'
    'mpv'
    'glfw-x11'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux.deb"
)
sha256sums=('ecd8137b7b4dcda7b59280728829131325bfb38762cce87db5c3bd43847f226a')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${_pkgname} %U|${pkgname%-bin} %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}