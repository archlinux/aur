# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-daoliti
pkgname=({otf,ttf,woff,woff2}-"${pkgbase}")
_zipname=AlimamaDaoLiTi-Regular
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alimama daoliti viet in text.阿里妈妈刀隶体为中文简体字库，一字重，收纳的中文字符包括但不限于GB2312，共计6763个汉字；英文大小写共52个；常用标点符号共227个，总计7042个字符"
arch=("any")
url="https://fonts.alibabagroup.com/#/more"
license=("custom")
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlimamaDaoLiTi/${_zipname}.zip"
    "LICENSE")
sha256sums=('64efbe748b44439c3417d38897b9f8733586c8b2bc82350c36ca69c699d3b4a1'
            'f86a3b947aae613c29c3a43dfaa404eeca01ed38707fa614ca174ae2177857bb')
prepare() {
    cd "${srcdir}/${_zipname}"
    mv "${_zipname}..woff" "${_zipname}.woff"
}
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}/${_zipname}"
    local fonts=("${_zipname}.${ext}")
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