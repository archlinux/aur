# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stackzy-bin
_pkgname=Stackzy
pkgver=1.2.6
pkgrel=4
pkgdesc="A cross-platform desktop application to identify libraries used inside an android application. Made possible by Compose Desktop"
arch=('x86_64')
url="https://github.com/theapache64/stackzy"
license=("Apache")
provides=("${pkgname%-bin}=${pkgver}")
confilcts=("${pkgname%-bin}")
depends=(
    'libxtst'
    'libglvnd'
    'fontconfig'
    'java-runtime'
    'libxrender'
    'alsa-lib'
    'libxi'
    'libxext'
    'libx11'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('be46f24ab891c1c3007715ceb539b006f281d445743ab77195c7c6f47cafbdeb'
            '33fcb3bd63d952033644afe53eaf5c94d877743d6fe848b23136c9fa0fbf8a19')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|/opt/${pkgname%-bin}/bin/${_pkgname}|${pkgname%-bin}|g" \
        -e "s|/opt/${pkgname%-bin}/lib/${_pkgname}.png|${pkgname%-bin}|g" \
        -e "s|Unknown|Utility;Development;|g" \
        -i "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}