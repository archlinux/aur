# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-agile
pkgname=({ttf,woff,woff2}-"${pkgbase}")
_fontname=AlimamaAgileVF
pkgver=1.0
pkgrel=5
# fonts.alibabadesign.com has enabled Referer anti-hotlinking; a Referer from the same domain is required to download files.
DLAGENTS=('https::/usr/bin/curl -fLC - --referer https://fonts.alibabadesign.com/ -o %o %u')
pkgdesc="A typeface for creating alimama agile viet in text.阿里妈妈灵动体——Alimama agile是一款西文四轴可变字体。这款字体包含了字重、字宽、倾斜、衬线四款可变方式，英文大小写共52个；常用标点符号共68个，总计120个字符。"
arch=("any")
url="https://fonts.alibabagroup.com/#/more"
license=("LicenseRef-custom")
source=(
    "${pkgbase}-${pkgver}.zip::https://fonts.alibabadesign.com/${_fontname}.zip"
    "LICENSE"
)
sha256sums=('4d3a6e3c0e958da623460f28e022bf23cd3401c96f59a08d7ef34123637a211f'
            'e3721ebffb491642f5dfbcecdedbcd4558c0f5ff2d051eba90d7b652975351bf')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}"
    local fonts=("${_fontname}-Thin.${ext}")
    local installdir="${ext^^}"
    # Prepare destination directory
    install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"
    # Install fonts
    local font
    for font in "${fonts[@]}"; do
        install -m644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}"
        install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}"
    done
}
for _pkgname in "${pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done
