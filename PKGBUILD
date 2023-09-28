# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-italic-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
pkgver=1.0
pkgrel=3
pkgdesc="A typeface for creating alibaba sans italic in text.阿里巴巴普惠体拉丁斜体,172语种,5字重"
arch=("any")
url="https://fonts.alibabagroup.com/#/font"
license=("custom")
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansItalics.zip"
    "license.txt")
sha256sums=('a6d7bfe17b7e04324edaa0872f513433255c8e8e5b8eece2fd78c15251ea1acb'
            '3c2a5fd682fd71bfc088c49e07015aaad3463dff7de1ceb385c55c042ffa0467')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for _weight in BoldItalic HeavyItalic Italic LightItalic MediumItalic;do
        cd "${srcdir}/AlibabaSansItalics/AlibabaSans-${_weight}"
        local fonts=("AlibabaSans-${_weight}.${ext}")
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