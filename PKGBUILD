# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-tc-fonts
pkgname=('ttf-alibabasans-tc-fonts' 'woff-alibabasans-tc-fonts' 'woff2-alibabasans-tc-fonts' 'eot-alibabasans-tc-fonts' 'otf-alibabasans-tc-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans tc in text"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansTC.zip")
sha512sums=('5a05bdf7ac500604b092567b077decf34e0ef865aafeecb9db46481c686781060aa3aa4587de50603a1fe13b4a486ea2ea5560a02178cc8e911db37fb94c512b')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 45 55 75 95;do
        cd "$srcdir/AlibabaSansTC/AlibabaSansTC-${num}"
        local fonts=(AlibabaSansTC*."$ext")
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