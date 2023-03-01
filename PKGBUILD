# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-jp-fonts
pkgname=('ttf-alibabasans-jp-fonts' 'woff-alibabasans-jp-fonts' 'woff2-alibabasans-jp-fonts' 'eot-alibabasans-jp-fonts' 'otf-alibabasans-jp-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans jp in text.阿里巴巴普惠体日文,3字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansJP.zip")
sha512sums=('990df32e5b42317e46a8cb283e42b3dc9bd3dc54281a13cf94a642e2fd5c9239f29ee7bd573b50034b9593b4841323af114c3d9dacce445ea174292c590f3905')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in Bold Medium Regular;do
        cd "$srcdir/AlibabaSansJP/AlibabaSansJP-${weight}"
        local fonts=(AlibabaSansJP-${weight}."$ext")
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
