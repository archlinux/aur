# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=danmoshui
pkgname="deepin-wine-${_pkgname}"
_sparkname="com.${_pkgname}.spark"
_zhsname="淡墨水字帖"
pkgver=0.0.6
pkgrel=3
pkgdesc="DanMoShui Calligraphy on deepin wine 6.基于Deepin Wine 6的淡墨水字帖PC版。"
arch=("x86_64")
url="https://danmoshui.com"
_downurl="https://d.store.deepinos.org.cn/store"
license=('custom')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::${_downurl}/office/${_sparkname}/${_sparkname}_${pkgver}spark0_amd64.deb"
    "LICENSE::${url}/privacy_policy"
    "${pkgname}.sh"
)
sha256sums=('8e2e1d90abf308a5f7eb105db2abb684d4b39955ce4fe3c4b09b2722eeb37f0f'
            'e984edcbcf35bb47fb35eb8f618b49a0c8e9dff561df32d65a1efab2af33a756'
            'e557286963f29a1a61c8b58d33e529535dcb2c97ecca98c1d33f773338884ccf')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    sed "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g;s|${_sparkname}|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}