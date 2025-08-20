# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soulfire-bin
_pkgname=SoulFire
pkgver=2.0.1
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
sha256sums_aarch64=('53e81b0851b7bde7e51ce678f297b49059cab66d82dd0739603c8d0b3f08cfcd')
sha256sums_x86_64=('46682d26047c96e1a09845a1044c0ceb31397164a54ed10c52642d265038d54d')
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
