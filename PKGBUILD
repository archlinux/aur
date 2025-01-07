# Maintainer: envolution
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# shellcheck shell=bash disable=SC2034,SC2154
pkgname="pa-dlna"
pkgver=0.15
pkgrel=1
pkgdesc="Forwards audio to DLNA devices via PulseAudio or PipeWira (via 'python-libpulse')"
arch=(
  'any'
)
url="https://gitlab.com/xdegaye/pa-dlna"
license=('MIT')
provides=(
  "pa-dlna=${pkgver}"
  "upnp-cmd=${pkgver}"
  "upnp-cmd-git=${pkgver}"
  "python-pa_dlna=${pkgver}"
  "python-pa_dlna-git=${pkgver}"
  "PULSEAUDIO-DLNA-SINK"
)
conflicts=(
  "upnp-cmd"
  "python-pa_dlna"
)
depends=(
  'libpulse' # For `parec` executable
  'python'
  'python-psutil'
  'python-libpulse'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
optdepends=(
  'ffmpeg: multiple formats support'
  'flac: flac transcoding support'
  'lame: mp3 transcoding support'
  'pulse-native-provider: To be used by a local pulseaudio implementation'
  'pipewire-pulse: To be used by a local pipewire implementation'
)
source=(
  "git+${url}.git#tag=${pkgver}"
)
sha256sums=('3271539db34c76dccfc535462279705d0ea5487cdbe95facdfefd768a092f393')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
