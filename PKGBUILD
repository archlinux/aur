# Maintainer: rie_t <megumin at megu dot dev>
pkgname=moonlight-canary-bin
_pkgname=moonlight-canary
pkgver=0.1.11
pkgrel=1
pkgdesc="A convenient launcher for the moonlight Discord mod (canary)"
arch=('x86_64')
url="https://github.com/MeguminSama/moonlight-launcher"
license=("GPL-3.0-only")
provides=("${_pkgname}")

depends=("libmoonlight-launcher")
optdepends=("discord: An install of Discord is required to run the launcher")

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-canary-v${pkgver}.tar.gz"
    "${_pkgname}.desktop"
)
sha256sums=(
    "30cc4156068161edd707b1eff92ee71373cc7287ee934632b43cf5839fb1aae5"
    "9eefc1f1921b018b9c8298649e46f9abbe6e99c966b55e81d17154844b3e4531"
)

package() {
    install -Dm755 "${srcdir}/moonlight-canary" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    _icon_sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512" "1024x1024")
    for _size in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/icons/icon-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
    done
}
