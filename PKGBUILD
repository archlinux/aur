# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=synergetica-bin
_pkgname=Synergetica
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern, end-to-end genetic circuit design desktop app.(Prebuilt version)"
arch=('x86_64')
url="https://khokao.github.io/synergetica"
_ghurl="https://github.com/khokao/synergetica"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'docker'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/khokao/synergetica/v${pkgver}/LICENSE"
)
sha256sums=('5e80611407a6671522647b0ff984eef6a71584ee8eb7d92c02072dfa8040d935'
            'fa2b6c636f574689d07afa919e7707f37e4d0f7b05902be1bb4fec9db3ed9d01')
prepare() {
    sed -i "3i\Comment=${pkgdesc}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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