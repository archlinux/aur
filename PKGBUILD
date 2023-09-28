# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-tc-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
_zipname=AlibabaSansTC
pkgver=1.0
pkgrel=4
pkgdesc="A typeface for creating alibaba sans tc in text.阿里巴巴普惠体繁体中文(Big5)4字重"
arch=("any")
url="https://fonts.alibabagroup.com/#/font"
license=("custom")
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/${_zipname}.zip"
    "license.txt")
sha256sums=('e82681df2085385b999d491fba6c41e81107ba405f6e0c1ec7aae1514becaedd'
            '2588d7120fe60eab0cfe10c8929c93cdcb57e86644e47ad645f0cc1857b02fc4')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 45 55 75 95;do
        cd "${srcdir}/${_zipname}/${_zipname}-${num}"
        local fonts=(${_zipname}*."${ext}")
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