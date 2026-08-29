# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=sonora
pkgver=0.24.1
pkgrel=1
pkgdesc='A native music streaming client, built with Rust and GPUI'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/sonora'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'dbus' 'fontconfig' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon'
         'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/sonora-v${pkgver}-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/sonora-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums=('ad95f7e2097e3cf9e914d806c2532c6cdb6c56cc984a2676e7d237eacd3bb14b')
sha256sums_x86_64=('284c78475820136fc2b7822c222f67193693454cde8060bb98a5e37542e16511')
sha256sums_aarch64=('4ae55c3fd18f92e9c192b1ef08d0b52482a13f0aa9d7f3cd1bc1e26e2db88004')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 assets/linux/sonora.desktop \
    "${pkgdir}/usr/share/applications/sonora.desktop"
  install -Dm644 assets/linux/sonora.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sonora.svg"

  for icon in assets/linux/icons/hicolor/*/apps/sonora.png; do
    local size
    size=$(basename "$(dirname "$(dirname "${icon}")")")
    install -Dm644 "${icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/sonora.png"
  done

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD-PARTY.md "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY.md"
  install -Dm644 assets/fonts/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Inter"
  install -Dm644 assets/icons/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Lucide"
}
