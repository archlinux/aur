# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=yadaw-bin
_pkgname=yadaw
pkgver=0.11.4
_tag=v0.11.4
pkgrel=1
pkgdesc='Yet Another mini-DAW - a lightweight sfx tool in pure Rust (binary)'
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/yadaw"
license=('AGPL-3.0-only')
depends=(alsa-lib libx11 libxcursor libxinerama libxrandr libxi)
optdepends=(
  'pipewire-pulse: for PipeWire audio support'
  'pulseaudio: for PulseAudio audio support'
)
provides=(yadaw clap-host lv2-host)
conflicts=(yadaw)
options=(!strip)
source_x86_64=("yadaw-0.11.4-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${_tag}/yadaw-0.11.4-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("yadaw-0.11.4-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${_tag}/yadaw-0.11.4-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9de87e41f25bb47cccf5a17c71a01b001d3fb9fe860bde9c150e2385234b3a4b')
sha256sums_aarch64=('ab106b3125a94d3a7047ec54a814bcbfd71cf7ec84f666cc5d3e26e53958b5ba')
source+=("icon.png::https://raw.githubusercontent.com/mlm-games/yadaw/master/fastlane/metadata/android/en-US/images/icon.png")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/yadaw-0.11.4-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/yadaw-0.11.4-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/yadaw" "${pkgdir}/usr/bin/yadaw"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/yadaw.desktop" << DESKTOP_EOF
[Desktop Entry]
Type=Application
Version=1.5
Name=Yadaw
Comment=Lightweight mini-DAW for sound design and prototyping with LV2/CLAP plugin support
Categories=AudioVideo;Audio;Music;Sequencer;Midi;
Keywords=audio;music;daw;midi;lv2;clap;plugin;sequencer;sound;
Exec=yadaw %F
Icon=yadaw
Terminal=false
StartupNotify=true
StartupWMClass=yadaw
MimeType=audio/midi;audio/x-midi;audio/wav;audio/x-wav;audio/flac;audio/mpeg;audio/ogg;application/x-dawproject;
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/yadaw.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/yadaw.png"
}
