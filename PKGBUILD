# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=mega-man-x-regenesis
pkgver=1.00.1
pkgrel=1
pkgdesc="A fan-made Mega Man X game set in an alternate timeline where Sigma has won"
arch=('x86_64')
url="https://mmxregenesis.itch.io/mega-man-x-regenesis"
license=('LicenseRef-proprietary')
depends=('glibc' 'alsa-lib' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'mesa')
optdepends=(
  'libpulse: PulseAudio audio support'
  'wayland: native Wayland support'
)
makedepends=('curl')
# Self-contained Godot binary with an embedded PCK; stripping would corrupt it.
options=(!strip !debug)

# The trailing number is the itch.io upload id for the Linux build.
# It changes with every release; find the new one in the page source
# (data-upload_id) or via: curl -s $url | grep -o 'data-upload_id="[0-9]*"'
_upload_id=18845226
source=(
  "${pkgname}-${pkgver}.x86_64::itch://mmxregenesis/mega-man-x-regenesis/${_upload_id}"
  "${pkgname}.desktop"
  "${pkgname}.png"
  "itch-dl.sh"
)
b2sums=('c428a4260bf8f8ed5e2afcac80d23256bfdd1551bc550a2f3df7d56bde4cd0622d5c0bb3019e044851aa06aaecc1323a1b314345998a834e6889314019f29080'
        'd8f2264a07d9d0dae799571da39194bfc9212b1096e84e0ee1b29f11c4d67e489b7e4b15d1e78e5b67b29291e165e22ebab07f9b88020ffbb0db4f16072c8e18'
        'af50b022103a57f46d324f773f748d326f8fc485326c778bb307d15f44279387ae0bab7fc38be99da676ab0f137188eba6a5e97ff7e518ffb5a29955c4fe1fbf'
        'c1ce296192f16c0050da40350dff2eb9573c9b75f48e0cd7a8b64a5fb7953d4243f3731fdcd012b11d4f15d42446882721a2eea1b36ef244f433fb72ed3d58de')
# itch.io download URLs are ephemeral (signed, 60s expiry); itch-dl.sh
# resolves itch://<user>/<game>/<upload_id> URLs at fetch time.
DLAGENTS+=("itch::/bin/sh ${PWD}/itch-dl.sh %u %o")

package() {
  install -Dm755 "${pkgname}-${pkgver}.x86_64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
