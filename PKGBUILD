# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=tokativ-bin
_pkgname=tokativ
pkgver=0.4.0
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
sha256sums=('c32e59e2fcfcddfb3e9795fe586dfc76188f8b1a316a083ab2e6bbd7ca763f2e')
sha256sums_x86_64=('43718c7eaee83dc4a5c579c24c09d0781f40d899b77e734a4089084e17a21f03')
sha256sums_aarch64=('6c641d7fc9f02920879eec99c30667a6f4adfc574e4725f5d6f30dac61aaa112')

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
