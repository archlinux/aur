# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-fonts
_fontname=AlibabaSans
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
pkgver=1.0
pkgrel=5
pkgdesc="A typeface for creating alibaba sans viet in text.阿里巴巴普惠体拉丁,172语种,6字重"
arch=("any")
url="https://fonts.alibabagroup.com/#/font"
license=("LicenseRef-custom")
source=(
    "${pkgbase}-${pkgver}.zip::https://fonts.alibabadesign.com/${_fontname}.zip"
    "license.txt"
)
sha256sums=('9f42a7ce944a012ab5693f9a10cf5707e43f5c70f2efe81bba3c9ca27b8b08c5'
            '8c5b90859607a46399a053b70476aaf1cf88a66b380c686082d9d408c5578cdd')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Black Bold Heavy Light Medium Regular;do
        cd "${srcdir}/${_fontname}/${_fontname}-${weight}"
        local fonts=("${_fontname}-${weight}.$ext")
        local installdir="${ext^^}"
        # Prepare destination directory
        install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"
        # Install fonts
        local font
            for font in "${fonts[@]}"; do
            install -m644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}"
            install -Dm644 "${srcdir}/license.txt" -t "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}"
        done
    done
}
for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done