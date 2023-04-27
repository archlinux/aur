# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-hk-fonts
pkgname=('ttf-alibabasans-hk-fonts' 'woff-alibabasans-hk-fonts' 'woff2-alibabasans-hk-fonts' 'eot-alibabasans-hk-fonts' 'otf-alibabasans-hk-fonts')
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alibaba sans hk in text.阿里巴巴普惠体繁体中文(HKSCS)4字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansHK.zip"
    "license.txt")
sha256sums=('2a3f977aa6d6f8f7abf4ffb01f033dfd606492a99a002b4163c463052b165cb6'
            '059e73dc0745c057bdd0654a98166f96e07bb6bd3a350459aa8f479c733f12ba')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 45 55 75 95;do
        cd "${srcdir}/AlibabaSansHK/AlibabaSansHK-${num}"
        local fonts=(AlibabaSansHK*."${ext}")
        local installdir="${ext^^}"

        # Prepare destination directory
        install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"

        # Install fonts
        local font
            for font in "${fonts[@]}"; do
            install -Dm644 "${font}" -t "${pkgdir}/usr/share/fonts/${installdir}"
            install -Dm644 "${srcdir}/license.txt" -t "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}"
        done
    done
}

for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done