# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alibabasans-italic-fonts
pkgname=('ttf-alibabasans-italic-fonts' 'woff-alibabasans-italic-fonts' 'woff2-alibabasans-italic-fonts' 'eot-alibabasans-italic-fonts' 'otf-alibabasans-italic-fonts')
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alibaba sans italic in text.阿里巴巴普惠体拉丁斜体,172语种,5字重"
arch=('any')
url='https://fonts.alibabagroup.com/#/font'
license=('custom')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlibabaSansItalics.zip")
sha512sums=('dcf7d58c1cc3468906db6b6e5b0562d6f0965e7dcd91cf5661f58a29bdd87878d4aada5e48da0bab3d610308e304f75ee400cbd078e4568fe763b2e0f5d15aa9')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for weight in BoldItalic HeavyItalic Italic LightItalic MediumItalic;do
        cd "$srcdir/AlibabaSansItalics/AlibabaSans-${weight}"
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
