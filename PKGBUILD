# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=padloc-bin
pkgver=4.3.0
pkgrel=5
pkgdesc="A modern, open source password manager for individuals and teams."
url="https://padloc.app/"
_ghurl="https://github.com/padloc/padloc"
arch=("x86_64")
license=("AGPL3")
depends=(
    'webkit2gtk'
    'gtk3'
    'hicolor-icon-theme'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_tauri_amd64.deb"
)
sha256sums=('d5bec5b1467cd98349e00d1c7a54a32703c31d9e69da553541ad13b3cdc45f60')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}