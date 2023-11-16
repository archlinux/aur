# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.20.3
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_ghurl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron28'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('13c263fa0007905784c1faa2b735f59bf04d53382034778614766d13630e116e')
sha256sums_aarch64=('8c9818110273b38eae809bef2f2e040f063b254e9e5d75e9a91fe6cad4daf30f')
sha256sums_armv7h=('e303bf0b3bfa591be093bb368702f64bb712ae858c0d3c5915bad31c604fdb1e')
sha256sums_x86_64=('16576a4a1fbb8b8bbb182f71643ddf406991e8a9e854ddb139484e523d58cc19')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s| %U| --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    #install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    #cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    #ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
}