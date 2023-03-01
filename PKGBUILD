# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-sea-fonts
pkgname=('ttf-alibabasans-sea-fonts' 'woff-alibabasans-sea-fonts' 'woff2-alibabasans-sea-fonts' 'eot-alibabasans-sea-fonts' 'otf-alibabasans-sea-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans sea in text.阿里巴巴普惠体SEA,拉丁+越南文+泰文语种组合,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansSEA.zip")
sha512sums=('e954f039bfbc9a17aeb81fbdb8c58d7d4c453166cebb726ce105d0bbc104038090cb071b7af36d3d84e6b2be0a1f4317699e582f66364aeef79c30ba2951c4be')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bd Md Rg;do
        cd "$srcdir/AlibabaSansSEA/AlibabaSansSEA-${weight}"
        local fonts=(AlibabaSansSEA-${weight}."$ext")
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
