# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-kr-fonts
pkgname=('ttf-alibabasans-kr-fonts' 'woff-alibabasans-kr-fonts' 'woff2-alibabasans-kr-fonts' 'eot-alibabasans-kr-fonts' 'otf-alibabasans-kr-fonts')
pkgver=1.0
pkgrel=2
pkgdesc="A typeface for creating alibaba sans kr in text.阿里巴巴普惠体韩文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansKR.zip"
    "license.txt")
sha256sums=('24934e108778badeda0962432527bdc8f3d81397424145effca6d10fab9c4d4e'
            '059e73dc0745c057bdd0654a98166f96e07bb6bd3a350459aa8f479c733f12ba')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bold Medium Regular;do
        cd "$srcdir/AlibabaSansKR/AlibabaSansKR-${weight}"
        local fonts=("AlibabaSansKR-${weight}.${ext}")
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