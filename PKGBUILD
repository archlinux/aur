# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-viet-fonts
pkgname=('ttf-alibabasans-viet-fonts' 'woff-alibabasans-viet-fonts' 'woff2-alibabasans-viet-fonts' 'eot-alibabasans-viet-fonts' 'otf-alibabasans-viet-fonts')
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alibaba sans viet in text.阿里巴巴普惠体越南文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansViet.zip"
    "license.txt")
sha256sums=('1cd7e0fdcc6f1400ae0d927c83031f4aec87280cdac54023c5f468f43c278d3a'
            '059e73dc0745c057bdd0654a98166f96e07bb6bd3a350459aa8f479c733f12ba')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bd Md Rg;do
        cd "${srcdir}/AlibabaSansViet/AlibabaSansViet-${weight}"
        local fonts=("AlibabaSansViet-${weight}.${ext}")
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