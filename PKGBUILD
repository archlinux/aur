# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=sonora
pkgver=0.13.0
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
sha256sums=('fd468f932345a50cf9691d2f38426138cdee62a3de69b5770d6be5670c984d6a')
sha256sums_x86_64=('df7db4fb7595c6ff1c028121f23a2473d935c97175f1ce4104e63b4aa77b289e')
sha256sums_aarch64=('bf57a7015e2a9ae74d56964bb56f1b6e167dfd3a40c8b8ea69079ce2396fb0e1')

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
