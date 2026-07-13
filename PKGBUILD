# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=implay-bin
_pkgname=ImPlay
pkgver=1.5.1
pkgrel=4
pkgdesc="Desktop media player built on top of mpv and imgui.(Prebuilt version)"
arch=('x86_64')
url="https://tsl0922.github.io/ImPlay"
_ghurl="https://github.com/tsl0922/ImPlay"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'freetype2'
    'mpv'
    'glfw'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux.deb"
    "${pkgname%-bin}.install"
    "${pkgname%-bin}-mpv.conf"
)
sha256sums=('ecd8137b7b4dcda7b59280728829131325bfb38762cce87db5c3bd43847f226a'
            'b1992e565dc86dd61391e2698d02795ee3a82db6cb2c363a936de757e974a6a0'
            'e5a5cb722dcdbba4e4b5424767907250855e5c689a2a25d2e076d96a196931b4')
install="${pkgname%-bin}.install"
prepare() {
    bsdtar -xf "${srcdir}/data."* -C "${srcdir}"
    sed -i "s/${_pkgname} %U/${pkgname%-bin} %U/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/implay-mpv.conf" "${pkgdir}/etc/implay/mpv.conf"
}
