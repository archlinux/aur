# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=bss
pkgname="${_pkgname}english-bin"
_pkgver=2.2.4
_subver=78
pkgver="${_pkgver}_${_subver}"
pkgrel=2
pkgdesc="bssenglish back word training software.(Prebuilt version)白杉树背单词训练软件."
arch=('x86_64')
url="https://bailplus.github.io/bssenglish.pages/"
_ghurl="https://github.com/BailPlus/bssenglish"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python-requests'
    'python-tqdm'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${_pkgver}_linux.deb"
)
sha256sums=('78df6582d8763a3fff55daafc49ec6e45747a07f8d5bdb411eec7277cdce0eac')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/bin\/${pkgname%-bin}/${pkgname%-bin}/g
        s/\/usr\/share\/pixmaps\/${_pkgname}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    ln -sf "/usr/lib/${pkgname%-bin}/${_pkgname}.py" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}