# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=bss
pkgname="${_pkgname}english-bin"
pkgver=2.0_65
pkgrel=7
pkgdesc="白杉树背单词训练软件."
arch=('x86_64')
url="https://bailplus.github.io/bssenglish.pages/"
_ghurl="https://github.com/BailPlus/bssenglish"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python>=3.9'
    'python-requests'
    'python-tqdm'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver%_65}_linux.deb"
)
sha256sums=('5a0c4292539f8c6f698fa2487ca626adb3014f5a835bec2431886e8dc6d51c4d')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|usr/lib|opt|g" -i "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}.py"
    sed "s|/usr/bin/${pkgname%-bin}|${pkgname%-bin}|g;s|/usr/share/pixmaps/${_pkgname}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}.py" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}