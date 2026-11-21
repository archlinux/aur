# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=aareco-bin
_pkgname=aareco
pkgver=0.1.6
_tag=v0.1.6
pkgrel=1
pkgdesc='Voice recorder with a topic tree, marks and plugin effects'
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/aareco"
license=('AGPL-3.0-or-later')
depends=(alsa-lib libx11 libxcursor libxinerama libxrandr libxi libwayland libxkbcommon)
optdepends=(
  'pipewire-pulse: for PipeWire audio support'
  'pulseaudio: for PulseAudio audio support'
)
provides=(aareco)
conflicts=(aareco)
options=(!strip)
source_x86_64=("aareco-0.1.6-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/aareco/releases/download/${_tag}/aareco-0.1.6-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("aareco-0.1.6-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/aareco/releases/download/${_tag}/aareco-0.1.6-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f737157c0864f072b60f86152a6e775aa63282986fae8df5eb599ebdfd6f2efa')
sha256sums_aarch64=('ed5f19154cf7cf84ba405b96f15cbdc5f9d8af214a23b0edc7a5a1870cee3032')
source+=("icon.png::https://raw.githubusercontent.com/mlm-games/aareco/master/others/packaging/icon.png")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/aareco-0.1.6-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/aareco-0.1.6-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/aareco" "${pkgdir}/usr/bin/aareco"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/aareco.desktop" << DESKTOP_EOF
[Desktop Entry]
Type=Application
Version=1.5
Name=Aareco
Comment=Voice recorder with a topic tree, marks and plugin effects
Categories=AudioVideo;Audio;Recorder;
Keywords=audio;recorder;voice;topics;marks;vst3;clap;
Exec=aareco
Icon=aareco
Terminal=false
StartupNotify=true
StartupWMClass=aareco-desktop
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/aareco.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/aareco.png"
}
