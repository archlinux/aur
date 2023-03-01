# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-thai-fonts
pkgname=('ttf-alibabasans-thai-fonts' 'woff-alibabasans-thai-fonts' 'woff2-alibabasans-thai-fonts' 'eot-alibabasans-thai-fonts' 'otf-alibabasans-thai-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans thai in text.阿里巴巴普惠体泰文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansThai.zip")
sha512sums=('c4bcb27ce845227bdc529212046e56c1649f1e9d7a430b073598e17ba326686fdee22cf6d37f886c916c25f9cea95df8ccbd905b8a5787bb9acdcdc92708c031')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bd Md Rg;do
        cd "$srcdir/AlibabaSansThai/AlibabaSansThai-${weight}"
        local fonts=(AlibabaSansThai-${weight}."$ext")
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
