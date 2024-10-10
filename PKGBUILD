# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=noi
pkgname="${_pkgname}-desktop-bin"
pkgver=0.4.0
_electronversion=28
pkgrel=2
pkgdesc="Power Your World with AI - Explore, Extend, Empower."
arch=("x86_64")
url="https://noi.nofwl.com/"
_ghurl="https://github.com/lencx/Noi"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'nss'
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_${pkgver}.deb"
)
sha256sums=('80921cf6a68aac06ef1051dfd23573e040bedabf17f90717bafe7085ec0fd928')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_pkgname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}