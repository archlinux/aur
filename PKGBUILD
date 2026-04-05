# Maintainer: Caio Augusto <augustocaio663 at gmail dot com>

pkgname=obs-studio-kepler-legacy-bin
_bundlever='30.2.3-kepler.2'
pkgver=${_bundlever//-/_}
pkgrel=1
pkgdesc='Legacy OBS Studio + FFmpeg bundle for NVIDIA Kepler GPUs on Arch Linux'
arch=('x86_64')
url='https://github.com/cainhooow/obs-studio-kepler-legacy'
license=('GPL-2.0-or-later')
options=('!debug' '!strip')
depends=(
  'alsa-lib'
  'bash'
  'curl'
  'gcc-libs'
  'glibc'
  'libjack.so=0-64'
  'libpipewire-0.3.so=0-64'
  'libpulse.so=0-64'
  'libdrm'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'libxcb'
  'qt6-base'
  'wayland'
)
optdepends=(
  'jack2: native JACK server implementation'
  'pipewire: PipeWire daemon and desktop integration for Wayland capture and related features'
  'pipewire-jack: PipeWire JACK replacement'
  'pipewire-pulse: PipeWire PulseAudio replacement'
  'pulseaudio: PulseAudio server implementation'
  'v4l2loopback-dkms: Linux virtual camera kernel module'
  'v4l2loopback-utils: virtual camera control utilities'
)
provides=('obs-studio-kepler-legacy')
conflicts=('obs-studio-kepler-legacy')
install='obs-studio-kepler-legacy.install'
source=(
  "$pkgname-$_bundlever.tar.gz::https://github.com/cainhooow/obs-studio-kepler-legacy/releases/download/v30.2.3-kepler.2/obs-studio-kepler-legacy-30.2.3-kepler.2.tar.gz"
)
sha256sums=(
  '1a79a1003f541ebcbdeab291fed22176efa8f1d6d3b4047afd1c99ee9ea6b44f'
)

package() {
  local bundle_dir="${srcdir}/obs-studio-kepler-legacy-${_bundlever}"
  local install_root="${pkgdir}/opt/obs-studio-kepler-legacy"
  local icon_src="${bundle_dir}/.local/obs-kepler/share/icons/hicolor"

  install -dm755 "${install_root}" "${pkgdir}/usr/bin"     "${pkgdir}/usr/share/applications"     "${pkgdir}/usr/share/icons/hicolor/128x128/apps"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps"     "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  cp -a "${bundle_dir}/.local" "${install_root}/"
  cp -a "${bundle_dir}/bin" "${install_root}/"
  cp -a "${bundle_dir}/docs" "${install_root}/"
  cp -a "${bundle_dir}/patches" "${install_root}/"
  cp -a "${bundle_dir}/scripts" "${install_root}/"
  cp -a "${bundle_dir}/share" "${install_root}/"
  cp -a "${bundle_dir}/CHANGELOG.md" "${install_root}/"
  cp -a "${bundle_dir}/README.md" "${install_root}/"
  cp -a "${bundle_dir}/SECURITY.md" "${install_root}/"
  cp -a "${bundle_dir}/VERSION" "${install_root}/"

  ln -s "/opt/obs-studio-kepler-legacy/bin/obs-studio-kepler-legacy"     "${pkgdir}/usr/bin/obs-studio-kepler-legacy"
  ln -s "/opt/obs-studio-kepler-legacy/bin/ffmpeg-kepler-legacy"     "${pkgdir}/usr/bin/ffmpeg-kepler-legacy"

  sed "s|@EXECUTABLE@|/usr/bin/obs-studio-kepler-legacy|g"     "${bundle_dir}/share/applications/obs-studio-kepler-legacy.desktop.in"     > "${pkgdir}/usr/share/applications/obs-studio-kepler-legacy.desktop"

  install -m644 "${icon_src}/128x128/apps/com.obsproject.Studio.png"     "${pkgdir}/usr/share/icons/hicolor/128x128/apps/obs-studio-kepler-legacy.png"
  install -m644 "${icon_src}/256x256/apps/com.obsproject.Studio.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/obs-studio-kepler-legacy.png"
  install -m644 "${icon_src}/512x512/apps/com.obsproject.Studio.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/obs-studio-kepler-legacy.png"
  install -m644 "${icon_src}/scalable/apps/com.obsproject.Studio.svg"     "${pkgdir}/usr/share/icons/hicolor/scalable/apps/obs-studio-kepler-legacy.svg"
}
