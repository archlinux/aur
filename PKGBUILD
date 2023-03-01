# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-puhuiti-fonts
pkgname=('ttf-alibabasans-puhuiti-fonts' 'woff-alibabasans-puhuiti-fonts' 'woff2-alibabasans-puhuiti-fonts' 'eot-alibabasans-puhuiti-fonts' 'otf-alibabasans-puhuiti-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans puhuiti in text.阿里巴巴普惠体简体中文,5字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaPuHuiTi.zip")
sha512sums=('1484af313f0ba1e573b39b10adaf971c1587cd278e4ce8faf915ea4ca7856ba7596a096967fb75c458cf6522069a8aedb258460ef816b0bf0acabb8f1e4266d4')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bold Heavy Light Medium Regular;do
        cd "$srcdir/AlibabaPuHuiTi/Alibaba-PuHuiTi-${weight}"
        local fonts=(Alibaba-PuHuiTi-${weight}."$ext")
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
