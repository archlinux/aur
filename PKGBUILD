# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tfiletransfer-bin
_pkgname=tFileTransfer
pkgver=2.3.0
pkgrel=1
pkgdesc="File transfer tools built with Compose for Desktop. It could send/receive files to/from other devices via LocalNetwork.(Prebuilt version)"
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
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('a9f4e39da6422cabaa8fa1dd61b3bb4890379c8d8d56efb92e18ae918896a37b'
            'bca1e51e3866688b7e458a7781fa03036c61a35559f6c40f4ab4c02a507c7b9e')
build() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/${pkgname%-bin} %U/g
        s/\/opt\/${pkgname%-bin}\/lib\/${_pkgname}.png/${pkgname%-bin}/g
        s/未知/Utility;/g
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
