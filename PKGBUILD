# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-sea-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
_zipname=AlibabaSansSEA
pkgver=1.0
pkgrel=3
pkgdesc="A typeface for creating alibaba sans sea in text.阿里巴巴普惠体SEA,拉丁+越南文+泰文语种组合,3字重"
arch=("any")
url="https://fonts.alibabagroup.com/#/font"
license=("custom")
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/${_zipname}.zip"
    "license.txt")
sha256sums=('57d4d74b11beafa235a3c5c519b98645ea4a3f7f025b89e31da1966e5d9b1c55'
            '2588d7120fe60eab0cfe10c8929c93cdcb57e86644e47ad645f0cc1857b02fc4')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bd Md Rg;do
        cd "${srcdir}/${_zipname}/${_zipname}-${weight}"
        local fonts=("${_zipname}-${weight}.${ext}")
        local installdir="${ext^^}"
        # Prepare destination directory
        install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"
        # Install fonts
        local font
            for font in "${fonts[@]}"; do
            install -m644 "$font" "${pkgdir}/usr/share/fonts/${installdir}"
            install -Dm644 "${srcdir}/license.txt" -t "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}"
        done
    done
}
for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done