# Maintainer: envolution
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
pkgname="pa-dlna"
pkgver=0.14
pkgrel=2
pkgdesc="Forwards audio streams to DLNA devices. For PulseAudio or PipeWira (via 'python-libpulse')"
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
  'python>=3.8'
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
sha256sums=('1864da0823a42d6a2a2785b7e67386c7fde29d630a1979e1d54dd392504c1cda')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
