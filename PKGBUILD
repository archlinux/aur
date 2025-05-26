# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=note-gen-bin
_pkgname=NoteGen
pkgver=0.16.4
pkgrel=1
pkgdesc="An AI notebook that focuses on recording and writing and is cross-platform.(Prebuilt version)一款专注于记录和写作的跨端AI笔记"
arch=('x86_64')
url="https://codexu.github.io/note-gen-help"
_ghurl="https://github.com/codexu/note-gen"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgname%-bin}-v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/codexu/note-gen/${pkgname%-bin}-v${pkgver}/LICENSE"
)
sha256sums=('f1fd8c246425761d529f002d27cdc3c65a8f476ebde3a9eceff8e4f64d943ebe'
            '72849df833a78f38636f2fdf8baf2bdc243e0ed5b7cacd7b40e510b7ca1a2547')
prepare() {
    sed -i -e "
        s/Comment=A Tauri App/Comment=${pkgdesc}/g
        s/Categories=/Categories=Utility;/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
