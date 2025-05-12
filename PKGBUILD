  # Maintainer: rie_t <megumin at megu dot dev>
  pkgname=moonlight-stable-bin
  _pkgname=moonlight-stable
  pkgver=0.1.9
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
      "831c5677a20d4c015279d9bc38758f27e424832351cbff044748ca314aee09d5"
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
