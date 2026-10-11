# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=yadaw-bin
_pkgname=yadaw
pkgver=0.11.6
_tag=v0.11.6
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
provides=(yadaw clap-host lv2-host vst3-host)
conflicts=(yadaw)
options=(!strip)
source_x86_64=("yadaw-0.11.6-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${_tag}/yadaw-0.11.6-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("yadaw-0.11.6-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/yadaw/releases/download/${_tag}/yadaw-0.11.6-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d57f9037aee74d58fac87794316de3d37f952f7959616854c5fbf5d5c442a77b')
sha256sums_aarch64=('ae23c72aaf968d1d59b1c50a00265eabc3c44af4413952bb0bf1fcfe10969854')
source+=("icon.png::https://raw.githubusercontent.com/mlm-games/yadaw/master/fastlane/metadata/android/en-US/images/icon.png")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/yadaw-0.11.6-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/yadaw-0.11.6-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/yadaw" "${pkgdir}/usr/bin/yadaw"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/yadaw.desktop" << DESKTOP_EOF
[Desktop Entry]
Type=Application
Version=1.5
Name=Yadaw
Comment=Lightweight mini-DAW for sound design and prototyping with LV2/CLAP/VST3 plugin support
Categories=AudioVideo;Audio;Music;Sequencer;Midi;
Keywords=audio;music;daw;midi;lv2;clap;vst3;plugin;sequencer;sound;
Exec=yadaw %F
Icon=yadaw
Terminal=false
StartupNotify=true
StartupWMClass=yadaw
MimeType=audio/midi;audio/x-midi;audio/wav;audio/x-wav;audio/vnd.wave;audio/flac;audio/mpeg;audio/mp3;audio/x-mp3;audio/x-mpg;audio/ogg;audio/vorbis;audio/x-vorbis;audio/x-vorbis+ogg;audio/mp4;audio/m4a;audio/aac;application/x-dawproject;application/x-yadaw;
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/yadaw.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/yadaw.png"
}
