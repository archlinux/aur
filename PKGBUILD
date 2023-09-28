# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-jp-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
pkgver=1.0
pkgrel=3
pkgdesc="A typeface for creating alibaba sans jp in text.阿里巴巴普惠体日文,3字重"
arch=("any")
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansJP.zip"
    "license.txt")
sha256sums=('6085bb7bc272bb975cd98e25e1077d2b1c047c31279af367e53892ec63020d2d'
            '2588d7120fe60eab0cfe10c8929c93cdcb57e86644e47ad645f0cc1857b02fc4')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bold Medium Regular;do
        cd "${srcdir}/AlibabaSansJP/AlibabaSansJP-${weight}"
        local fonts=("AlibabaSansJP-${weight}.${ext}")
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