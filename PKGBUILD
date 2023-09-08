# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=supersonic-desktop-bin
_pkgname=Supersonic
pkgver=0.5.1
pkgrel=2
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers."
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libglvnd' 'libx11' 'mpv')
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.xz")
sha256sums=('510cd8f058706536f06a145137cb47409ddbbaa887f07c66b5615f1110ec5c7c')
prepare() {
    sed "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/usr/local/share/applications/${_pkgname}.desktop"
    echo -e "Comment=A lightweight cross-platform desktop client for Subsonic music servers." >> "${srcdir}/usr/local/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin,usr/lib}
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-desktop-bin}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/local/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/local/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    ln -s "/usr/lib/libmpv.so.2.0.0" "${pkgdir}/usr/lib/libmpv.so.1"
}