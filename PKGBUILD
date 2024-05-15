# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=git-good-bin
pkgver=0.1.4
_subver=r24.g43e637f
_electronversion=27
pkgrel=10
pkgdesc="Just a simple git client using electron and nodegit, focus on lightweight and performance"
arch=("x86_64")
url="https://github.com/weedz/git-good"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.${_subver}-1-${CARCH}.pkg.tar.zst"
    "${pkgname%-bin}.sh"
)
sha256sums=('f0b0cb5f7bdcb9708bce7f51ee9a603e088402d5774e831af7bb6b94948c6624'
            '41b6d61dffef064762b3eec3dfeca7a3e1f57cbcb6dce9a6940c06797a0eae9d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}