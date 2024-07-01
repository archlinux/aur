# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=bss
pkgname="${_pkgname}english-bin"
_pkgver=2.1.3
_subver=70
pkgver="${_pkgver}_${_subver}"
pkgrel=1
pkgdesc="白杉树背单词训练软件."
arch=('x86_64')
url="https://bailplus.github.io/bssenglish.pages/"
_ghurl="https://github.com/BailPlus/bssenglish"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python>=3.7'
    'python-requests'
    'python-tqdm'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${_pkgver}_linux.deb"
)
sha256sums=('37a74f30af509baf7eb1f9302290799e2ca42631a987da6a1f183b50a8245534')
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