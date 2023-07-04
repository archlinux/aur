# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=supersonic-desktop-bin
_pkgname=Supersonic
pkgver=0.4.0
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers."
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage" "${pkgname%-desktop-bin}")
depends=('glibc' 'libglvnd' 'libx11' 'mpv')
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.xz")
sha256sums=('a12d1ead738ff20146c39b264018dd99cb9c7788ab35cc2a8b2a5443cf509cc2')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-desktop-bin}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=${pkgname%-desktop-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/local/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/local/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/local/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    ln -s "/usr/lib/libmpv.so.2.0.0" "${pkgdir}/usr/lib/libmpv.so.1"
}