# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=padloc-bin
pkgver=4.3.0
pkgrel=8
pkgdesc="A modern, open source password manager for individuals and teams.(Prebuilt version)"
url="https://padloc.app/"
_ghurl="https://github.com/padloc/padloc"
arch=('x86_64')
license=('AGPL-3.0-only')
depends=(
    'webkit2gtk'
    'gtk3'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_tauri_amd64.deb"
)
sha256sums=('d5bec5b1467cd98349e00d1c7a54a32703c31d9e69da553541ad13b3cdc45f60')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}