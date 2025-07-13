# Maintainer: rie_t <megumin at megu dot dev>
pkgname=moonlight-ptb-bin
_pkgname=moonlight-ptb
pkgver=0.1.11
pkgrel=1
pkgdesc="A convenient launcher for the moonlight Discord mod (ptb)"
arch=('x86_64')
url="https://github.com/MeguminSama/moonlight-launcher"
license=("GPL-3.0-only")
provides=("${_pkgname}")

depends=("libmoonlight-launcher")
optdepends=("discord: An install of Discord is required to run the launcher")

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/MeguminSama/moonlight-launcher/releases/download/v${pkgver}/moonlight-ptb-v${pkgver}.tar.gz"
    "${_pkgname}.desktop"
)
sha256sums=(
    "8274e5d35f479ea743e0a967d1ad30550cd98c319beb047e348c896780a99dc8"
    "94009dcac58ff72cb56bdb043e7ae903a6ddcc93a1ae5d6421872127e4c1910a"
)

package() {
    install -Dm755 "${srcdir}/moonlight-ptb" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    _icon_sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512" "1024x1024")
    for _size in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/icons/icon-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
    done
}
