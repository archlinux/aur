# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=tokativ-bin
_pkgname=tokativ
pkgver=0.5.0
pkgrel=1
pkgdesc='Local dictation that types into the focused app as you speak'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/tokativ'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'alsa-lib' 'libxkbcommon' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs'
            'pipewire-alsa: microphone input through PipeWire'
            'pulseaudio-alsa: microphone input through PulseAudio')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${url}/archive/refs/tags/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/tokativ-v${pkgver}-x86_64-unknown-linux-gnu")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/tokativ-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums=('2bfe85996598076bf94fca6e64b722169f688fe8bf08bae0e7f7275296205b57')
sha256sums_x86_64=('8118594ad43f7fd810c7d6caed2c4757602114d26aca1c96eac43baf6f83dd95')
sha256sums_aarch64=('88170b067b42d2dcf3193c85707a7c279743e96e4a7ed306c3677328155dcdeb')

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 assets/linux/tokativ.desktop \
    "${pkgdir}/usr/share/applications/tokativ.desktop"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 assets/fonts/LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.Inter"
  install -Dm644 assets/silero/LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.silero-vad"
  install -Dm644 assets/icons/LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.lucide"
  install -Dm644 assets/emoji/LICENSE \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.Unicode"
}
