# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=alimama-dongfangdakai
pkgname=({otf,ttf,woff,woff2}-"${pkgbase}")
_fontname=AlimamaDongFangDaKai
pkgver=1.0
pkgrel=6
# fonts.alibabadesign.com has enabled Referer anti-hotlinking; a Referer from the same domain is required to download files.
DLAGENTS=('https::/usr/bin/curl -fLC - --referer https://fonts.alibabadesign.com/ -o %o %u')
pkgdesc="A typeface for creating alimama dongfangdakai viet in text.阿里妈妈东方大楷为中文简体字库,收纳的中文字符包括但不限于GB2312,共计6763个汉字"
arch=("any")
url="https://fonts.alibabagroup.com/#/more"
license=("LicenseRef-custom")
source=(
    "${pkgbase}-${pkgver}.zip::https://fonts.alibabadesign.com/${_fontname}.zip"
    "LICENSE"
)
sha256sums=('bb960f0f464a42c14ed215f4e1b4bde0b2e69bafe85be3e71ca1abf54c4ab553'
            'abf3fdf5a6a4b50515c6fa5c92bcac6553ab6e8ac72869fba68e4a10b7603ac7')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}"
    local fonts=("${_fontname}-Regular.${ext}")
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
