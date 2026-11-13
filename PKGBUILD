# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xinghuo-note-bin
_debname=com.gitee.xinghuo.note
pkgver=3.0.4
_releasedata=20261110
pkgrel=1
pkgdesc="Note Master, a convenient note-taking tool for recording temporary information, reminders, or to-do tasks on the desktop. Beautiful interface, small size, and fast speed.(Prebuilt version)"
arch=('x86_64')
url="https://gitee.com/xinghuowangluo/note"
license=('MulanPSL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_debname}_${pkgver}-${_releasedata}_amd64_Deepin25.deb"
    "LICENSE-${pkgver}::https://gitee.com/xinghuowangluo/note/blob/${pkgver}/LICENSE"
)
sha256sums=('7faba3fbb8eceb91728cd2d30af41a1f7a175254c90b5d944c0a3204907d6db2'
            '76a39d97506331162e727db73fa9047d31df8a6d09ff65bb57483546c0a09421')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Name=note/Name=Xinghuo Note/g
        s/\/opt\/apps\/${_debname}\/bin\/note/${pkgname%-bin}/g
        s/\/opt\/apps\/${_debname}\/icon\/note.png/${pkgname%-bin}/g
        s/Categories=Application/Categories=Utility;/g
    " "${srcdir}/usr/share/applications/note.desktop"
}
package() {
    install -Dm755 "${srcdir}/opt/apps/${_debname}/bin/note" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/icon/note.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/note.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
