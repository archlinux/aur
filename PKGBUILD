# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-kr-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
pkgver=1.0
pkgrel=3
pkgdesc="A typeface for creating alibaba sans kr in text.阿里巴巴普惠体韩文,3字重"
arch=("any")
url='https://fonts.alibabagroup.com/#/font'
license=("custom")
source=("${pkgbase}-${pkgver}.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansKR.zip"
    "license.txt")
sha256sums=('24934e108778badeda0962432527bdc8f3d81397424145effca6d10fab9c4d4e'
            '21f82c5d76f51fe4b8442593cbc9f0d04f3bad634461a7d1d7094ead271648cf')
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