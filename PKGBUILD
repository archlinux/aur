# Maintainer: Pavel Olizko <contact@nolight.dev>

# Rendered on every stable release from aur/sonora-bin/PKGBUILD in github.com/sonorahq/sonora by
# its release workflow, which overwrites any change made in the AUR repository.

pkgname=sonora-bin
_pkgname=sonora
pkgver=0.50.0
pkgrel=1
pkgdesc='A native, familiar music streaming client'
arch=('x86_64' 'aarch64')
url='https://github.com/sonorahq/sonora'
license=('GPL-3.0-or-later')
depends=('glibc' 'alsa-lib' 'dbus' 'fontconfig' 'hicolor-icon-theme' 'libxcb'
         'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs'
            'pipewire-alsa: audio output through PipeWire'
            'pulseaudio-alsa: audio output through PulseAudio'
            'webkit2gtk-4.1: sign in to YouTube Music through a browser window')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/archive/refs/tags/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/sonora-v${pkgver}-x86_64-unknown-linux-gnu")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/sonora-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums=('149a059f27df649e81476ab6f69455c43e9d701d0da8995f6ddfbbf72fe48daa')
sha256sums_x86_64=('9d237f02071db3184b7fcee0e08f16c9369df93cc8190af2518e33400941286c')
sha256sums_aarch64=('f13bbb239e8b207722930b6492cd6067f83eb2c19d4c2d02075e5933285a2518')

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
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

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 THIRD-PARTY.md "${pkgdir}/usr/share/licenses/${_pkgname}/THIRD-PARTY.md"
  install -Dm644 assets/fonts/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.Inter"
  install -Dm644 assets/icons/LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkgname}/icons/LICENSE"

  for licence in assets/icons/*/LICENSE; do
    local pack
    pack=$(basename "$(dirname "${licence}")")
    install -Dm644 "${licence}" \
      "${pkgdir}/usr/share/licenses/${_pkgname}/icons/LICENSE.${pack}"
  done
}
