# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xinghuo-note-bin
_debname=com.gitee.xinghuo.note
pkgver=1.6.4
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
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_debname}_${pkgver}-20241130_amd64_Deepin23.deb"
    "LICENSE-${pkgver}::https://gitee.com/xinghuowangluo/note/blob/v${pkgver}/LICENSE"
)
sha256sums=('4755a3a36973a35fef5fe9450a622c7dd29b71218ed1aa8cf8b346b84a5ef319'
            '8a9cc05fde1a7b1ea22e75ac44679619609d332cb1377dc73aaa57f68bdcc80d')
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