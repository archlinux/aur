# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-fangyuanti
pkgname=("ttf-${pkgbase}" "woff-${pkgbase}" "woff2-${pkgbase}")
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alimama fangyuanti viet in text.阿里妈妈方圆体是阿里妈妈·智造字通过智能AI的方式完成的一款简体中文双轴可变字体。收纳的中文字符包括但不限于GB2312，共计6763个汉字；英文大小写共52个；常用标点符号共227个，总计7042个字符"
arch=('any')
url='https://fonts.alibabagroup.com/#/more'
license=('custom:freeware')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlimamaFangYuanTiVF/AlimamaFangYuanTiVF-Thin.zip"
    "LICENSE::https://www.yuque.com/alimama_ai-font/vfse9w/fco5g1gifud8lls2?singleDoc#%E3%80%8A%E3%80%8A%E9%98%BF%E9%87%8C%E5%A6%88%E5%A6%88%E6%96%B9%E5%9C%86%E4%BD%93%E3%80%8B%E6%B3%95%E5%BE%8B%E5%A3%B0%E6%98%8E%E3%80%8B")
sha256sums=('9c84435c93f85ad7f2082d488eb0fdb606ca44a4ae1f54be6e53c244f501c956'
            '84b969e6bcb0649ca6071b28cf15089056321166a99bac3c587a1c67cb382ae4')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}/AlimamaFangYuanTiVF-Thin"
    local fonts=("AlimamaFangYuanTiVF-Thin.${ext}")
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