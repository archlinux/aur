# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=ttplayer
pkgname="deepin-wine-${_officalname}"
_sparkname="com.qianqian.${_officalname}.spark"
pkgver=5.7
_sparkver=5.7.spark0
pkgrel=3
pkgdesc="千千静听是一款完全免费的音乐播放软件,集播放、音效、转换、歌词等众多功能于一身。利用DeepinWine6重新进行封装。"
arch=("x86_64")
url="https://www.baidu.com/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'deepin-wine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=("${_officalname}")
provides=("${_officalname}=${pkgver}")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${_sparkname}/${_sparkname}_${_sparkver}_i386.deb"
    "${pkgname}.install"
    "run.sh")
sha256sums=('4494df38c9bc9c47e697e8a96f69c678e4635389ccc74e19dd324f0a668c62ec'
            'f28af6815df326acfa937fdc1fa5c7583bfdb7d66aadb1b9615a3f474bbf7939'
            '8fb90bf0a094f6e508a23b2b243d036c022544c6b7c45b995353401764ddafb3')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    sed "s|${_sparkname}|${pkgname}|g;s|Music|AudioVideo|g;s|/opt/apps/${_sparkname}/files/run.sh|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" 
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/apps"
    cp -r "${srcdir}/opt/apps/${pkgname%-bin}" "${pkgdir}/opt/apps"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}