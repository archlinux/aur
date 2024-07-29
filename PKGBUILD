# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=napcat-bin
_pkgname=NapCat
pkgver=1.7.0
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
sha256sums_aarch64=('069725a0d40c4b20fd1d9900a2ac632bb95a7502ef6d15576c9fda2c6545a4d7')
sha256sums_x86_64=('f7af0f8345dcd3a8e79ecc659c19d70dcceefff59415ab1e82933f9e3b3c0238')
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