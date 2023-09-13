# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=implay-bin
_pkgname=ImPlay
pkgver=1.4.0
pkgrel=3
pkgdesc="Desktop media player built on top of mpv and imgui"
arch=('x86_64')
url="https://tsl0922.github.io/ImPlay"
_githuburl="https://github.com/tsl0922/ImPlay"
license=('GPL2')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'gcc-libs' 'glib2' 'freetype2' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-Linux.deb")
sha256sums=('4eb6307e15998d44875b472e94b4d09321f05fdb86cc7e59cfed93c0981feab5')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${_pkgname} %U|${pkgname%-bin} %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}