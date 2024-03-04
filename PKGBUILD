# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tfiletransfer-bin
_pkgname=tFileTransfer
pkgver=2.2.1
pkgrel=6
pkgdesc="File transfer tools built with Compose for Desktop. It could send/receive files to/from other devices via LocalNetwork."
arch=('x86_64')
url="https://github.com/Tans5/tFileTransfer_desktop"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'java-runtime'
    'libxtst'
    'libglvnd'
    'libxrender'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('949d4f774f79f03ed44bdca7cf3d6a8bee3d8c1a096e367f2dfc4161dca8d3cd'
            '386f823e2cb5e962ca22010f63a0681cc059c6d77b236fb2650f0694010c0867')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${pkgname%-bin}/bin/${_pkgname}|${pkgname%-bin} %U|g" \
        -e "s|/opt/${pkgname%-bin}/lib/${_pkgname}.png|${pkgname%-bin}|g;s|未知|Utility;|g" \
        -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}