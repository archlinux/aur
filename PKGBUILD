# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stackzy-bin
_pkgname=Stackzy
pkgver=1.2.6
pkgrel=7
pkgdesc="A cross-platform desktop application to identify libraries used inside an android application. Made possible by Compose Desktop"
arch=('x86_64')
url="https://github.com/theapache64/stackzy"
license=("Apache-2.0")
provides=("${pkgname%-bin}=${pkgver}")
confilcts=("${pkgname%-bin}")
depends=(
    'java-runtime'
    'libxrender'
    'alsa-lib'
    'libxi'
    'libxtst'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('be46f24ab891c1c3007715ceb539b006f281d445743ab77195c7c6f47cafbdeb'
            '0b2d50b001b1fa7a0a1a18e86827b31f13dabc8258e39c54266cb9ab6210f568')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${pkgname%-bin}/bin/${_pkgname}|${pkgname%-bin}|g" \
        -e "s|/opt/${pkgname%-bin}/lib/${_pkgname}.png|${pkgname%-bin}|g" \
        -e "s|Unknown|Development;|g" \
        -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}