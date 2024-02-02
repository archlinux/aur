# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=git-good-bin
pkgver=0.1.4
_subver=r24.g43e637f
_electronversion=25
pkgrel=7
pkgdesc="Just a simple git client using electron and nodegit, focus on lightweight and performance"
arch=("x86_64")
url="https://github.com/weedz/git-good"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.${_subver}-1-${CARCH}.pkg.tar.zst"
    "${pkgname%-bin}.sh"
)
sha256sums=('f0b0cb5f7bdcb9708bce7f51ee9a603e088402d5774e831af7bb6b94948c6624'
            '97a81d2a8426672cab73bc8634d96007180bd3039915f74b8fdb71d6667f00ec')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}