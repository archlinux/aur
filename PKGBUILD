# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-puhuiti3-fonts
pkgname=('ttf-alibabasans-puhuiti3-fonts' 'woff-alibabasans-puhuiti3-fonts' 'woff2-alibabasans-puhuiti3-fonts' 'eot-alibabasans-puhuiti3-fonts' 'otf-alibabasans-puhuiti3-fonts')
pkgver=3.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans puhuiti3 in text.阿里巴巴普惠体简体中文(3.0),7字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaPuHuiTi-3.zip"
    "LICENSE::https://www.yuque.com/yiguang-wkqc2/puhuiti/nus9wiinq4aeiegy")
sha256sums=('f25f730b6a7661bcd5b9764dc98f05d3ac25ee771977cf04b31ed5fba9f496a7'
            '316d980931db7a218d97ee87dbef1b44829015ce9ff18ff6cb5acb7789442a70')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 35-Thin 45-Light 55-Regular 55-RegularL3 65-Medium 75-SemiBold 85-Bold 95-ExtraBold 105-Heavy 115-Black;do
        cd "${srcdir}/AlibabaPuHuiTi-3/AlibabaPuHuiTi-3-${num}"
        local fonts=("AlibabaPuHuiTi-3-${num}.${ext}")
        local installdir="${ext^^}"
 
        # Prepare destination directory
        install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"
 
        # Install fonts
        local font
            for font in "${fonts[@]}"; do
            install -m644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}"
            install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}"
        done
    done
}
 
for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done