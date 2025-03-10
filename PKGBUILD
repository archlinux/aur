# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-daoliti
pkgname=({otf,ttf,woff,woff2}-"${pkgbase}")
_fontname=AlimamaDaoLiTi
pkgver=1.0
pkgrel=4
pkgdesc="A typeface for creating alimama daoliti viet in text.阿里妈妈刀隶体为中文简体字库，一字重，收纳的中文字符包括但不限于GB2312，共计6763个汉字；英文大小写共52个；常用标点符号共227个，总计7042个字符"
arch=("any")
url="https://fonts.alibabagroup.com/#/more"
license=("LicenseRef-custom")
source=(
    "${pkgbase}-${pkgver}.zip::https://fonts.alibabadesign.com/${_fontname}.zip"
    "LICENSE"
)
sha256sums=('01cf8a0e91a7cb4ca742a6dbeb74c83dc0953ae33e4d70dc3fbc03222d8a7458'
            'f86a3b947aae613c29c3a43dfaa404eeca01ed38707fa614ca174ae2177857bb')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}/${_fontname}"
    local fonts=("${_fontname}.${ext}")
    local installdir="${ext^^}"
    # Prepare destination directory
    install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"
    # Install fonts
    local font
    for font in "${fonts[@]}"; do
        install -m644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}"
        install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}"
    done
}
for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done