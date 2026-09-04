# Maintainer: Loopwire contributors
pkgname=loopwire-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux virtual audio routing workspace"
arch=("x86_64" "aarch64")
url="https://github.com/sandwichfarm/loopwire"
license=("MIT" "Apache-2.0")
depends=("webkit2gtk-4.1" "nodejs" "pipewire" "wireplumber")
optdepends=(
  "pipewire-pulse: PulseAudio compatibility"
  "jack2: JACK bridge diagnostics"
  "alsa-utils: ALSA diagnostics"
)
source_x86_64=("loopwire-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/loopwire-linux-x86_64.tar.gz")
source_aarch64=("loopwire-linux-aarch64.tar.gz::${url}/releases/download/v${pkgver}/loopwire-linux-aarch64.tar.gz")
sha256sums_x86_64=("1ade654cfc8a6b7e3e5a8557a2bc53747dcc92d2555bb98a36510a5538e4b562")
sha256sums_aarch64=("e598ddc1250341961fc388308437ffe3fd6b85f83c9b8b9ed2ebc9925ee6d0bf")

package() {
  install -Dm755 loopwire "${pkgdir}/usr/bin/loopwire"
  install -Dm755 loopwire-dsp-provider "${pkgdir}/usr/bin/loopwire-dsp-provider"
  install -Dm755 loopwire-jack-ports "${pkgdir}/usr/bin/loopwire-jack-ports"
  install -Dm755 loopwire-detect-audio "${pkgdir}/usr/bin/loopwire-detect-audio"
  install -dm755 "${pkgdir}/usr/lib/loopwire"
  cp -R libexec/loopwire/. "${pkgdir}/usr/lib/loopwire/"
  find "${pkgdir}/usr/lib/loopwire" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/lib/loopwire" -type f -exec chmod 0644 {} +
  chmod 0755 "${pkgdir}/usr/lib/loopwire/loopwire-gui"
}
