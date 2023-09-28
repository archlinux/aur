# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-fangyuanti
pkgname=({ttf,woff,woff2}-"${pkgbase}")
_zipname=AlimamaFangYuanTiVF-Thin
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alimama fangyuanti viet in text.阿里妈妈方圆体是阿里妈妈·智造字通过智能AI的方式完成的一款简体中文双轴可变字体。收纳的中文字符包括但不限于GB2312，共计6763个汉字；英文大小写共52个；常用标点符号共227个，总计7042个字符"
arch=("any")
url="https://fonts.alibabagroup.com/#/more"
license=("custom")
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlimamaFangYuanTiVF/${_zipname}.zip"
    "LICENSE")
sha256sums=('9c84435c93f85ad7f2082d488eb0fdb606ca44a4ae1f54be6e53c244f501c956'
            '475e9f306ddb72deefd4aa3f0b0d1c48c0dda0484309f8dffbc39143ddfd22ac')
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