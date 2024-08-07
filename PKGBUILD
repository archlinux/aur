# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=napcat-bin
_pkgname=NapCat
pkgver=1.8.3
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
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_aarch64=('1669cf13fbb09b232e3d1beb01aa0cc340411e77e4bb38750bae762d00b5f518')
sha256sums_x86_64=('ce12f3c4c09f8f6af7805780fc1b77e520cb72fa89a68253c29c3c817d07ad92')
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