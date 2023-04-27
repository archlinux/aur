# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-puhuiti-fonts
pkgname=('ttf-alibabasans-puhuiti-fonts' 'woff-alibabasans-puhuiti-fonts' 'woff2-alibabasans-puhuiti-fonts' 'eot-alibabasans-puhuiti-fonts' 'otf-alibabasans-puhuiti-fonts')
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alibaba sans puhuiti in text.阿里巴巴普惠体简体中文,5字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaPuHuiTi.zip"
    "license.txt")
sha256sums=('e6f9ad768c9c346d63982a9059268cd0788ef52bb63d50f31f0dc2bdae6d1002'
            '059e73dc0745c057bdd0654a98166f96e07bb6bd3a350459aa8f479c733f12ba')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bold Heavy Light Medium Regular;do
        cd "${srcdir}/AlibabaPuHuiTi/Alibaba-PuHuiTi-${weight}"
        local fonts=("Alibaba-PuHuiTi-${weight}.${ext}")
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