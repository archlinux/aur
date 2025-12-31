# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=yadaw-bin
_pkgname=yadaw
pkgver=0.5.3
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

source=("icon.png::https://raw.githubusercontent.com/mlm-games/yadaw/refs/heads/master/fastlane/metadata/android/en-US/images/icon.png")

sha256sums_x86_64=('2a653d174f0ece9d35b1e9f96f0f9e8867b3e45f24083309bab036e13620dc7d')
sha256sums_aarch64=('771e822ec2b24e127370980846911a55a4c583918d26a77b4202c558baa65ac3')
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
Exec=${_pkgname} %F
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=AudioVideo;Audio;
MimeType=audio/midi;audio/x-midi;application/x-midi;audio/x-wav;audio/wav;audio/flac;audio/mpeg;audio/ogg;
StartupNotify=true
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
