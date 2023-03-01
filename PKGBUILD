# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-puhuiti2-fonts
pkgname=('ttf-alibabasans-puhuiti2-fonts' 'woff-alibabasans-puhuiti2-fonts' 'woff2-alibabasans-puhuiti2-fonts' 'eot-alibabasans-puhuiti2-fonts' 'otf-alibabasans-puhuiti2-fonts')
pkgver=2.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans puhuiti2 in text.阿里巴巴普惠体简体中文(2.0),9字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaPuHuiTi-2.zip")
sha512sums=('bac168c1dedb58c11f5ef01985b7d48129481e249d6f05b47eb7d8b4dd95e0209175cd6c7f02d6baedf59dc73b073e7be793d5bd70903b1d5ebc3cbe2cfd1b74')

function _package {
    rm -rf "${src}"/AlibabaPuHuiTi-2/AlibabaPuHuiTi-2-35-Thin/AlibabaPuHuiTi-2-35-Thin.zip
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 105-Heavy 115-Black 35-Thin 45-Light 55-Regular 65-Medium 75-SemiBold 85-Bold 95-ExtraBold;do
        cd "$srcdir/AlibabaPuHuiTi-2/AlibabaPuHuiTi-2-${num}"
        local fonts=(AlibabaPuHuiTi-2-${num}."$ext")
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
