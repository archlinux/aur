# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=ttplayer
pkgname="deepin-wine-${_officalname}"
_sparkname="com.qianqian.${_officalname}.spark"
pkgver=5.7
pkgrel=4
pkgdesc="千千静听是一款完全免费的音乐播放软件,集播放、音效、转换、歌词等众多功能于一身。利用DeepinWine6重新进行封装。"
arch=("x86_64")
url="https://www.baidu.com/"
_downurl=https://d.store.deepinos.org.cn/store
license=('custom:freeware')
conflicts=("${_officalname}")
provides=("${_officalname}=${pkgver}")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'hicolor-icon-theme'
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::${_downurl}/music/${_sparkname}/${_sparkname}_${pkgver}.spark0_i386.deb"
    "${pkgname}.sh"
)
sha256sums=('4494df38c9bc9c47e697e8a96f69c678e4635389ccc74e19dd324f0a668c62ec'
            '34ef3059b4d3c680e6487fe36824288b0f3a3b19110a0e8a0ea4d0207a8837d9')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    sed "s|${_sparkname}|${pkgname}|g;s|Music|AudioVideo|g;s|/opt/apps/${pkgname}/files/run.sh|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" 
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}