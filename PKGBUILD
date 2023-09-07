# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuvviewer-bin
_pkgname=YUVviewer
pkgver=0.5.3
pkgrel=2
pkgdesc="A small tool for developers to view and preview various original image formats. It is based on Qt and opencv frameworks and supports windows/linux/macos."
arch=("x86_64")
url="https://github.com/QQxiaoming/YUVviewer"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libxcb' 'fontconfig' 'libgpg-error' 'freetype2' 'libx11' 'libglvnd' 'xdg-utils' 'gcc-libs' 'zlib')
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${_pkgname}_Linux_V053_${CARCH}.deb")
sha256sums=('7fbcc7574ace8fc611e6545012355aa7fd57d9277f88ec8291e4906abc8b68df')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/bin/${_pkgname}|${pkgname%-bin}|g;s|/opt/${_pkgname}/${_pkgname}.png|${pkgname%-bin}|g;s|Commen|Comment|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}