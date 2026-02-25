# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quadrant-bin
_pkgname=Quadrant
pkgver=26.2.1
pkgrel=1
pkgdesc="An easy way to manage your Minecraft modpacks, written in React and Rust.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://mrquantumoff.dev/projects/quadrant"
_ghurl="https://github.com/mrquantumoff/quadrant"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}-stable/${_pkgname}-${pkgver}-stable-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}-stable/${_pkgname}-${pkgver}-stable-1.x86_64.rpm")
sha256sums_aarch64=('c06c940864f68c4739971c3c2bb546af49e8423d6e3650be6fc02a40e19a9b99')
sha256sums_x86_64=('9981a60fc263263e8c215f439e427c5b921ad12e33ffd4b04465fd65b8d4fb17')
prepare() {
    sed -i "s/${pkgname%-bin}_next/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}_next" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}_next.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
