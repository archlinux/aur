# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=git-good-bin
pkgver=0.1.4
pkgrel=4
pkgdesc="Just a simple git client using electron and nodegit, focus on lightweight and performance"
arch=("x86_64")
url="https://github.com/weedz/git-good"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.r10.gba5f431-1-${CARCH}.pkg.tar.zst"
    "${pkgname%-bin}.sh")
sha256sums=('ee6398e00e3cf73f87bd629ce2fd002e4987dfbaf4b3b7c4b55f0ff4046b32b2'
            '2c36774bd402835bf9df9cfaa1fd95c6945b9bb0d6fc41d8c0c11bc898cba4f7')
prepare() {
    asar e "${srcdir}/usr/share/${pkgname%-bin}/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s| %F||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}