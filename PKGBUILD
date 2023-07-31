# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-daoliti
pkgname=("ttf-${pkgbase}" "otf-${pkgbase}" "woff-${pkgbase}" "woff2-${pkgbase}")
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alimama daoliti viet in text.阿里妈妈刀隶体为中文简体字库，一字重，收纳的中文字符包括但不限于GB2312，共计6763个汉字；英文大小写共52个；常用标点符号共227个，总计7042个字符"
arch=('any')
url='https://fonts.alibabagroup.com/#/more'
license=('custom:freeware')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlimamaDaoLiTi/AlimamaDaoLiTi-Regular.zip"
    "LICENSE::https://www.yuque.com/alimama_ai-font/vfse9w/ynqpf9pt8wops4sl?singleDoc#%E3%80%8A%E3%80%8A%E9%98%BF%E9%87%8C%E5%A6%88%E5%A6%88%E5%88%80%E9%9A%B6%E4%BD%93%E3%80%8B%E6%B3%95%E5%BE%8B%E5%A3%B0%E6%98%8E%E3%80%8B")
sha256sums=('64efbe748b44439c3417d38897b9f8733586c8b2bc82350c36ca69c699d3b4a1'
            '65479619f42df571bb38a7f64317e2247f5c4a5505bbd4025fb4c26b1a17e185')
prepare() {
    cd "${srcdir}/AlimamaDaoLiTi-Regular"
    mv "AlimamaDaoLiTi-Regular..woff" "AlimamaDaoLiTi-Regular.woff"
}
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}/AlimamaDaoLiTi-Regular"
    local fonts=("AlimamaDaoLiTi-Regular.${ext}")
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