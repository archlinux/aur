# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-hk-fonts
pkgname=('ttf-alibabasans-hk-fonts' 'woff-alibabasans-hk-fonts' 'woff2-alibabasans-hk-fonts' 'eot-alibabasans-hk-fonts' 'otf-alibabasans-hk-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans hk in text.阿里巴巴普惠体繁体中文(HKSCS)4字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansHK.zip")
sha512sums=('d2f09a10d213ed353164b1658eda0a759fdd00da015e52200935980a619e917d0b700a61ff99b07ba643c05fd12368c4573199d7bf77a1bad7fcf428c399b3e2')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 45 55 75 95;do
        cd "$srcdir/AlibabaSansHK/AlibabaSansHK-${num}"
        local fonts=(AlibabaSansHK*."$ext")
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
