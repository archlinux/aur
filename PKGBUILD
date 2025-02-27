# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# PKGBUILD inspiration from fira-code
pkgbase=taobaomaicaiti
pkgname=({otf,ttf,woff,woff2}-"${pkgbase}")
_fontname=TaoBaoMaiCaiTi
pkgver=1.0
pkgrel=2
pkgdesc="Taobao buys vegetables hand in hand with Tongyi Jinshu, and strives to create a unique AI personalized font.淘宝买菜携手通义锦书，倾力打造了一款独具匠心的AI个性化字体。这款智能AI字体不仅拥有丰富的中文字符库，覆盖GB2312标准，包含超过6974个汉字，更通过智能AI技术，赋予字体独特的质感和生命力。"
arch=("any")
url="https://www.alibabafonts.com/#/more"
license=("LicenseRef-custom")
source=(
    "${pkgbase}-${pkgver}.zip::https://puhuiti3.oss-cn-hangzhou.aliyuncs.com/${_fontname}.zip"
    "LICENSE"
)
sha256sums=('b5fd796c3d7eeaf0c138a6e6784309ebf18e60f88d3ce018574359d0a9a01dcd'
            '1d0588d8badf3073db4f3ffc2fd64463d57d48bd8ddb4eb850d6ca7d32c11bd1')
function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "${srcdir}/${_fontname}-Regular"
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