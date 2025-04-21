# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=lucide-font
pkgname=({eot,ttf,woff,woff2}-"${pkgbase}")
_fontname=Lucide
pkgver=0.501.0
pkgrel=1
pkgdesc='Beautiful & consistent icon toolkit made by the community.'
arch=("any")
url="https://lucide.dev"
_ghurl="https://github.com/lucide-icons/lucide"
licenses=('ISC')
source=(
    "${pkgbase}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${pkgbase}-${pkgver}.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lucide-icons/lucide/${pkgver}/LICENSE"
)
sha256sums=('216b8a32f4bd96b95ee22f1644d984ae67390419884dfb02b1e3d7f2256c66c7'
            '1e7290b35280a048667bbf0ebabac1c7fd52a75300e8b2946ac165715997f2bc')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}/${pkgbase}"
    local fonts=("${pkgbase%-font}.${ext}")
    local installdir="${ext^^}"
    # Prepare destination directory
    install -Dm755 -d "${pkgdir}/usr/share/fonts/${installdir}"
    # Install fonts
    local font
    for font in "${fonts[@]}"; do
        install -Dm644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}"
        install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}/LICENSE"
    done
}
for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done