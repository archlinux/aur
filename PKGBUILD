# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soulfire-bin
_pkgname=SoulFire
pkgver=2.8.1
pkgrel=1
pkgdesc="A frontend for the SoulFire server. It mainly targets the web, but uses native APIs using Tauri.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://app.soulfiremc.com/"
_ghurl="https://github.com/AlexProgrammerDE/SoulFireClient"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('b5eaa0d7ba664af325dfe6c64b5d24b13d8737bd8fd15e771633ead4515474df')
sha256sums_x86_64=('645a8d933dacecafac612edaeb9b4bd6ef1a2c80c3d5d2ac7c6dbfe985212e43')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/com.${pkgname%-bin}mc.${pkgname%-bin}/${pkgname%-bin}/g" \
        "${srcdir}/usr/share/metainfo/com.${pkgname%-bin}mc.${pkgname%-bin}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/metainfo/com.${pkgname%-bin}mc.${pkgname%-bin}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
