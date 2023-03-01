# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-viet-fonts
pkgname=('ttf-alibabasans-viet-fonts' 'woff-alibabasans-viet-fonts' 'woff2-alibabasans-viet-fonts' 'eot-alibabasans-viet-fonts' 'otf-alibabasans-viet-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans viet in text.阿里巴巴普惠体越南文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansViet.zip")
sha512sums=('140f7e5b728a6f6864d99cb173e18c08cf2e860c0c6d7393e98ac9198537e4c82d65102d52e86271dd8fb1291b680f876210ee2a8b65aaaa6782e65572756a0a')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bd Md Rg;do
        cd "$srcdir/AlibabaSansViet/AlibabaSansViet-${weight}"
        local fonts=(AlibabaSansViet-${weight}."$ext")
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
