# Maintainer: rie_t <megumin at megu dot dev>
pkgname=moonlight-stable-bin
_pkgname=moonlight-stable
pkgver=0.1.11
pkgrel=1
pkgdesc="A convenient launcher for the moonlight Discord mod (stable)"
arch=('x86_64')
url="https://github.com/MeguminSama/moonlight-launcher"
license=("GPL-3.0-only")
provides=("${_pkgname}")

depends=("libmoonlight-launcher")
optdepends=("discord: An install of Discord is required to run the launcher")

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-stable-v${pkgver}.tar.gz"
    "${_pkgname}.desktop"
)
sha256sums=(
    "32f2e2c645e5fb2f6f21ea11643feb0d4fd954d1d850d27f2d0aaf349b1d3c95"
    "f7a9166a288c5b09c0ca94bec75dbe64a347df41709460b20f9933dff45e0bf4"
)

package() {
    install -Dm755 "${srcdir}/moonlight-stable" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    _icon_sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512" "1024x1024")
    for _size in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/icons/icon-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
    done
}
