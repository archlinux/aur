# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-puhuiti-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
_zipname=Alibaba-PuHuiTi
pkgver=1.0
pkgrel=3
pkgdesc="A typeface for creating alibaba sans puhuiti in text.阿里巴巴普惠体简体中文,5字重"
arch=("any")
url="https://fonts.alibabagroup.com/#/font"
license=("custom")
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/${_zipname//-/}.zip"
    "license.txt")
sha256sums=('e6f9ad768c9c346d63982a9059268cd0788ef52bb63d50f31f0dc2bdae6d1002'
            'd8a5691d7a5a7542a379ab9a568a16ca5cd5506e758fb46789bb79b42cb5635a')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bold Heavy Light Medium Regular;do
        cd "${srcdir}/${_zipname//-/}/${_zipname}-${weight}"
        local fonts=("${_zipname}-${weight}.${ext}")
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