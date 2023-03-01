# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-fonts
pkgname=('ttf-alibabasans-fonts' 'woff-alibabasans-fonts' 'woff2-alibabasans-fonts' 'eot-alibabasans-fonts' 'otf-alibabasans-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans viet in text.阿里巴巴普惠体拉丁,172语种,6字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSans.zip")
sha512sums=('881a5a614e981269fd0609749a9c4876b245982f8857389e2e2dc4b98a8b5145e6b5d069e30c679c4bae491d4c8f8c15b6e0b67b505b89390588553e154427b3')
 
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Black Bold Heavy Light Medium Regular;do
        cd "$srcdir/AlibabaSans/AlibabaSans-${weight}"
        local fonts=(AlibabaSans-${weight}."$ext")
        local installdir="${ext^^}"
 
        # Prepare destination directory
        install -dm755 "$pkgdir/usr/share/fonts/$installdir"
 
        # Install fonts
        local font
            for font in "${fonts[@]}"; do
            install -m644 "$font" "$pkgdir/usr/share/fonts/$installdir"
        done
    done
}
 
for _pkgname in "${pkgname[@]}"; do
    eval "function package_$_pkgname() { _package $_pkgname; }"
done
