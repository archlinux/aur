# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-jp-fonts
pkgname=('ttf-alibabasans-jp-fonts' 'woff-alibabasans-jp-fonts' 'woff2-alibabasans-jp-fonts' 'eot-alibabasans-jp-fonts' 'otf-alibabasans-jp-fonts')
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alibaba sans jp in text.阿里巴巴普惠体日文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansJP.zip"
    "license.txt")
sha256sums=('6085bb7bc272bb975cd98e25e1077d2b1c047c31279af367e53892ec63020d2d'
            '94bd4647501c152d7267474d93c624c909a4dbc07a8b8427805b7ba4aad30621')

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
