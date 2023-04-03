# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-dongfangdakai
pkgname=("ttf-${pkgbase}" "woff-${pkgbase}" "woff2-${pkgbase}" "otf-${pkgbase}")
pkgver=1.0
pkgrel=1
pkgdesc="A typeface for creating alimama dongfangdakai viet in text.阿里妈妈东方大楷为中文简体字库,收纳的中文字符包括但不限于GB2312,共计6763个汉字"
arch=('any')
url='https://fonts.alibabagroup.com/#/more'
license=('custom:freeware')
depends=()
source=("$pkgbase-$pkgver.zip::https://puhuiti.oss-cn-hangzhou.aliyuncs.com/AlimamaDongFangDaKai.zip")
sha256sums=('e98f63d03cd3a9e98ed4a577a2113dbf932d5cd7faff74a0c3c596fbbaa654ce')
  
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "$srcdir/AlimamaDongFangDaKai-Regular"
    local fonts=(AlimamaDongFangDaKai-Regular."$ext")
    local installdir="${ext^^}"
  
    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/$installdir"
  
    # Install fonts
    local font
    for font in "${fonts[@]}"; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/$installdir"
    done
}
  
for _pkgname in "${pkgname[@]}"; do
    eval "function package_$_pkgname() { _package $_pkgname; }"
done
