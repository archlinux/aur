# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=lucide-font
pkgname=({eot,ttf,woff,woff2}-"${pkgbase}")
_fontname=Lucide
pkgver=1.8.0
pkgrel=1
pkgdesc='Beautiful & consistent icon toolkit made by the community.'
arch=("any")
url="https://lucide.dev"
_ghurl="https://github.com/lucide-icons/lucide"
license=('ISC')
source=(
    "${pkgbase}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${pkgbase}-${pkgver}.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lucide-icons/lucide/${pkgver}/LICENSE"
)
sha256sums=('32beec9fcb0cd07e86329cfc1735886bf2f888351bf929422000478d38278371'
            'b495047bd93a9b06913511076f504daba17d5bbeb3e0650f3bb53a4220329c57')
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
    done
    # Install license for each sub-package
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done