# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=tokativ-bin
_pkgname=tokativ
pkgver=0.7.0
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
sha256sums=('384d8bf88164826267306d9fd7c8f74979975af46b9fe7bb1dc320206906da14')
sha256sums_x86_64=('da206cc8b49a5b738ccdbcfbc9a325ffbf30207044d8b420abcd28ce2dd14be1')
sha256sums_aarch64=('90430b5f445e4f07fc24d0b1452c19f81f281e33fb7f13d561a87723d9b20b69')

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
