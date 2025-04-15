# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rhyolite-bin
_pkgname=Rhyolite
pkgver=0.1.9
pkgrel=1
pkgdesc="A simple text editor written in Rust using Tauri and svelte for frontend, inspired by Obsidian.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://rhyolite.xyz/"
_ghurl="https://github.com/rhyolite-org/rhyolite"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('830c901d0cee9e8da67891935a4929e96252542dcdd865dd69670759c6917a1b')
sha256sums_x86_64=('5a8df025b4358776a7bcde5ba75f5ae5745932b5601c9747daed2763f2ae3196')
prepare() {
    sed -i -e "
        s/Categories=/Categories=Utility;/g
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
