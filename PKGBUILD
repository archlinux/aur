# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-agile
pkgname=({ttf,woff,woff2}-"${pkgbase}")
_zipname=AlimamaAgileVF-Thin
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alimama agile viet in text.阿里妈妈灵动体——Alimama agile是一款西文四轴可变字体。这款字体包含了字重、字宽、倾斜、衬线四款可变方式，英文大小写共52个；常用标点符号共68个，总计120个字符。"
arch=("any")
url="https://fonts.alibabagroup.com/#/more"
license=("custom")
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlimamaAgileVF/${_zipname}.zip"
    "LICENSE")
sha256sums=('a54aabb5111d8a37bebacafcc9e137fc2efa277893270105109183681347dfd1'
            'e3721ebffb491642f5dfbcecdedbcd4558c0f5ff2d051eba90d7b652975351bf')
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