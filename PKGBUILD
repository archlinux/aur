# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttfviewer-bin
_pkgname=TTFviewer
pkgver=0.2.4
pkgrel=2
pkgdesc="A small tool for developers to view and preview various ttf font/icon image formats. It is based on Qt and opencv frameworks and supports windows/linux/macos."
arch=("x86_64")
url="https://github.com/QQxiaoming/TTFviewer"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libxcb' 'fontconfig' 'libgpg-error' 'freetype2' 'libx11' 'libglvnd' 'xdg-utils' 'gcc-libs' 'zlib')
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${_pkgname}_Linux_V${pkgver//./}_${CARCH}.deb")
sha256sums=('d7ec98e1d72b235d51ebb73d7d8353c4b6ab73fa7cdb0bdb2c1c44fbb8fdf4f0')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname}.png|${pkgname%-bin}|g;s|/usr/bin/${_pkgname}|${pkgname%-bin}|g;s|Commen|Comment|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}