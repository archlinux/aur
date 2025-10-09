# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=lucide-font
pkgname=({eot,ttf,woff,woff2}-"${pkgbase}")
_fontname=Lucide
pkgver=0.545.0
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
sha256sums=('30ceacc98b5dcbd58a4170547cfbd8e08c04023b6ec17e72ab1a432c43cd61f1'
            '3c57143f22dac950efebf84002e360bba5458c7b90fe583b0667aaaef1a7256e')
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
