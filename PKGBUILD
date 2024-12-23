# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: yustin <#archlinux-proaudio@libera.chat>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=24.02.2
pkgrel=3
pkgdesc="A DAW, plugins and wave editor"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/stargatedaw/stargate"
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'fftw'
  'gcc-libs'
  'glibc'
  'lame'
  'libsndfile'
  'portaudio'
  'portmidi'
  'python'
  'python-bson'
  'python-distro'
  'python-jinja'
  'python-mido'
  'python-mutagen'
  'python-numpy'
  'python-psutil'
  'python-pyaudio'
  'python-pygame'
  'python-pyqt5'
  'python-pyqt6'
  'python-pyaml'
  'python-pymarshal'
  'python-rtmidi'
  'python-wavefile'
  'python-yaml'
  'qt6-svg'
  'rubberband'
  'vorbis-tools'
)
makedepends=(
  'gcc'
  'git'
  'make'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stargatedaw/stargate/archive/refs/tags/release-${pkgver}.tar.gz"
  "git+https://github.com/spatialaudio/portaudio-binaries.git"
  "git+https://github.com/stargatedaw/stargate-sbsms.git"
  "git+https://github.com/stargatedaw/stargate-soundtouch.git"
)
sha256sums=('93c6bc604cb8d6bea851a73f8de92364771aa84f8ccdd516ad0a20870e951d7f'
            'SKIP'
            'SKIP'
            'SKIP')
prepare() {
  mv "${pkgname}-release-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}/src"
  # Manually clone submodule sources to the correct vendor directories
  git clone https://github.com/spatialaudio/portaudio-binaries.git vendor/portaudio-binaries
  git clone https://github.com/stargatedaw/stargate-soundtouch.git vendor/soundtouch
  git clone https://github.com/stargatedaw/stargate-sbsms.git vendor/sbsms
}

build() {
  cd "${pkgname}-${pkgver}/src"
  PLAT_FLAGS="${CFLAGS}" make all
}

package() {
  cd "${pkgname}-${pkgver}/src"
  DESTDIR="${pkgdir}" make install
}

# vim:set ts=2 sw=2 et:
