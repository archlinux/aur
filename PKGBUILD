# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=aareco-bin
_pkgname=aareco
pkgver=0.1.4
_tag=v0.1.4
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
source_x86_64=("aareco-0.1.4-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/aareco/releases/download/${_tag}/aareco-0.1.4-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("aareco-0.1.4-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/aareco/releases/download/${_tag}/aareco-0.1.4-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('19dc883f1d22fc109f522bf9bbe5535fcab7b031e14f480c25903ea580881be8')
sha256sums_aarch64=('2eb31054e9950a4b06a8344ef69357ccd8f860b797f88a332518640f1859a932')
source+=("icon.png::https://raw.githubusercontent.com/mlm-games/aareco/master/others/packaging/icon.png")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/aareco-0.1.4-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/aareco-0.1.4-aarch64-unknown-linux-gnu"
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
