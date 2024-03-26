# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=noi
pkgname="${_pkgname}-desktop-bin"
pkgver=0.4.0
_electronversion=28
pkgrel=1
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
    sed "s|${_pkgname} %U|${pkgname%-bin} --no-sandbox %U|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}