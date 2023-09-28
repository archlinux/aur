# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-puhuiti2-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
_zipname=AlibabaPuHuiTi-2
pkgver=2.0
pkgrel=3
pkgdesc="A typeface for creating alibaba sans puhuiti2 in text.阿里巴巴普惠体简体中文(2.0),9字重"
arch=("any")
url="https://fonts.alibabagroup.com/#/font"
license=("custom")
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/${_zipname}.zip"
    "license.txt")
sha256sums=('9ad37e0756cd5383abde2757da65c8a4da934a2215a869267ec688c6ec2843c5'
            '5fa72680af66db4f5c30c97fca7a8a6af31801d227675348a93b1c4126e61b61')
function _package {
    rm -rf "${srcdir}/${_zipname}/${_zipname}-35-Thin/${_zipname}-35-Thin.zip"
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 105-Heavy 115-Black 35-Thin 45-Light 55-Regular 65-Medium 75-SemiBold 85-Bold 95-ExtraBold;do
        cd "${srcdir}/${_zipname}/${_zipname}-${num}"
        local fonts=("${_zipname}-${num}.${ext}")
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