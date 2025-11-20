# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=yadaw-bin
_pkgname=yadaw
pkgver=0.3.2
pkgrel=1
pkgdesc="Yet Another mini-DAW - a lightweight sfx tool in pure Rust (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/yadaw"
license=('GPL3')
depends=('alsa-lib' 'lilv' 'suil' 'sratom' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi')
optdepends=(
  'pipewire-pulse: for PipeWire audio support'
  'pulseaudio: for PulseAudio audio support'
)
provides=('yadaw')
conflicts=('yadaw')
options=('!strip')

source_x86_64=("${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
# Icon
source=("icon.png::https://raw.githubusercontent.com/mlm-games/yadaw/refs/heads/master/src/experiments/icon.png")

sha256sums_x86_64=('893b70161a4a78432b2feab62430cdd3f9e8ae8d7508138891c15d674a74116e')
sha256sums_aarch64=('9fd66d67f0212e1526cc7f8c7cc4a87c02ec02114b84355cb3d7cfb50c3ad5ee')
sha256sums=('SKIP') # for icon.png

package() {
  local target
  if [[ "$CARCH" == "x86_64" ]]; then
    target="x86_64-unknown-linux-gnu"
  else
    target="aarch64-unknown-linux-gnu"
  fi

  local dir="${srcdir}/${_pkgname}-${pkgver}-${target}"
  install -Dm755 "${dir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=YADAW
Comment=A Sfx creation tool (maybe a little more than that)
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=AudioVideo;Audio;
StartupNotify=true
DESKTOP_EOF

  # Icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
