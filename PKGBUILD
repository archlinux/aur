# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=risuai-bin
_pkgname=RisuAI
pkgver=166.3.0
pkgrel=1
pkgdesc="Make your own story. User-friendly software for LLM roleplaying.(Prebuilt version)"
arch=('x86_64')
url="https://risuai.net/"
_ghurl="https://github.com/kwaroran/RisuAI"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'python'
    'python-pydantic'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('d794d9cc8f4c99788a49f45c5ffa95d27dacf920009c9d155fd9d28187f433ca')
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}" "${pkgdir}/usr/lib"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
