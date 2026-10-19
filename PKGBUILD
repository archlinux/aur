# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=tokativ-bin
_pkgname=tokativ
pkgver=0.6.0
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
sha256sums=('3e8d5ba381588a6d33be08a63d55905abe9c20a90f7c934a7b9d68ff946063bb')
sha256sums_x86_64=('f23c013496ba8baaba596a7a1f43c47ccfbb1a5f255153b63ba084bd8182c486')
sha256sums_aarch64=('5f4f1b92dfa10d9d47b8017bbee08e6678f7359097f8126dbe0c6efa084800c2')

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
