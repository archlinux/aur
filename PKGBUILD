# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=napcat-bin
_pkgname=NapCat
pkgver=1.6.9
pkgrel=1
pkgdesc="基于NTQQ的无头Bot框架."
arch=(
    'aarch64'
    'x86_64'
)
url="https://napneko.github.io/"
_ghurl="https://github.com/NapNeko/NapCatQQ"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'linuxqq'
    'nodejs'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/NapNeko/NapCatQQ/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.linux.arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.linux.x64.zip")
sha256sums=('f9dd38354229f567957ca10faeba7c2ee381db370507ca1db46d1ab7224ea5fc')
sha256sums_aarch64=('9312191789f37e41d2b65bbbacb0bd9f160229a9a52e0618bd6f5e7aaa019fc8')
sha256sums_x86_64=('e82538386c486324e1c8c30e90a18a790440d83939b584e4a6f7562e10e30b3f')
build() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    chmod 755 "${srcdir}/${_pkgname}.linux."*/"${pkgname%-bin}".*
}
package() {
   install -Dm755 -d "${pkgdir}"/{opt/"${pkgname%-bin}",usr/bin}
   cp -r "${srcdir}/${_pkgname}.linux."*/*  "${pkgdir}/opt/${pkgname%-bin}"
   ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${_pkgname}.linux."*/logs/logo.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}