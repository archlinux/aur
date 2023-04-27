# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-thai-fonts
pkgname=('ttf-alibabasans-thai-fonts' 'woff-alibabasans-thai-fonts' 'woff2-alibabasans-thai-fonts' 'eot-alibabasans-thai-fonts' 'otf-alibabasans-thai-fonts')
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alibaba sans thai in text.阿里巴巴普惠体泰文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansThai.zip"
    "license.txt")
sha256sums=('b41735285d66376af524efb599cfaf421bba73072ef624a03504eaaa97d5ca80'
            '059e73dc0745c057bdd0654a98166f96e07bb6bd3a350459aa8f479c733f12ba')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bd Md Rg;do
        cd "${srcdir}/AlibabaSansThai/AlibabaSansThai-${weight}"
        local fonts=("AlibabaSansThai-${weight}.${ext}")
        local installdir="${ext^^}"

        # Prepare destination directory
        install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"

        # Install fonts
        local font
            for font in "${fonts[@]}"; do
            install -m644 "${font}" "$pkgdir/usr/share/fonts/${installdir}"
            install -Dm644 "${srcdir}/license.txt" -t "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}"
        done
    done
}

for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done