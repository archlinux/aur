# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=openhome-bin
_pkgname=OpenHome
pkgver=1.9.2
pkgrel=1
pkgdesc="Application for importing and transferring Pokémon between save files.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/andrewbenington/OpenHome"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('e3d3591a8df4622935438cb9d164a0a682d9be1ceaf88f7c9e0237116f5062e7')
sha256sums_x86_64=('6dda69ece6c2219d70b735934f8ae5f1bca48152f9c9900da8ed335b37c7f1e4')
prepare() {
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
