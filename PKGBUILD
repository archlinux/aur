# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-kr-fonts
pkgname=('ttf-alibabasans-kr-fonts' 'woff-alibabasans-kr-fonts' 'woff2-alibabasans-kr-fonts' 'eot-alibabasans-kr-fonts' 'otf-alibabasans-kr-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans kr in text.阿里巴巴普惠体韩文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansKR.zip")
sha512sums=('1abefc4d779c1d79a079f114cfa066d0b38e97c853b6a770bcd4ac96ea057a4e43a257a7caa4c1308d41ed90ffaf852decdec5fd1aae01f5b7d145440d6d99e8')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bold Medium Regular;do
        cd "$srcdir/AlibabaSansKR/AlibabaSansKR-${weight}"
        local fonts=(AlibabaSansKR-${weight}."$ext")
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
