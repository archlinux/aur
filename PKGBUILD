# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-tc-fonts
pkgname=('ttf-alibabasans-tc-fonts' 'woff-alibabasans-tc-fonts' 'woff2-alibabasans-tc-fonts' 'eot-alibabasans-tc-fonts' 'otf-alibabasans-tc-fonts')
pkgver=1.0
pkgrel=3
pkgdesc="A typeface for creating alibaba sans tc in text.阿里巴巴普惠体繁体中文(Big5)4字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansTC.zip"
    "license.txt")
sha256sums=('e82681df2085385b999d491fba6c41e81107ba405f6e0c1ec7aae1514becaedd'
            '059e73dc0745c057bdd0654a98166f96e07bb6bd3a350459aa8f479c733f12ba')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 45 55 75 95;do
        cd "${srcdir}/AlibabaSansTC/AlibabaSansTC-${num}"
        local fonts=(AlibabaSansTC*."${ext}")
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