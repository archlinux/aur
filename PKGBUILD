# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: yustin <#archlinux-proaudio@libera.chat>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname="stargate"
pkgver="24.02.2"
pkgrel=4
pkgdesc="A DAW, plugins and wave editor"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/stargatedaw/stargate"
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'fftw'
  'gcc-libs'
  'glibc'
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
)
makedepends=(
  'gcc'
  'git'
  'make'
)
optdepends=(
  'ffmpeg: For additional audio and video format support'
  'lame: For MP3 encoding support'
  'vorbis-tools: For Ogg Vorbis support'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/stargatedaw/stargate/archive/refs/tags/release-${pkgver}.tar.gz"
  "git+https://github.com/spatialaudio/portaudio-binaries.git#commit=71bfaa6f71693b3d18d1cab0ddb0d16e0f767cc9"
  "git+https://github.com/stargatedaw/stargate-sbsms.git#commit=64fc9d97688ee02c2d93094d5d4b013c07ba4fcf"
  "git+https://github.com/stargatedaw/stargate-soundtouch.git#commit=464f474c0be5d7e0970909dd30593012e4621468"
)
sha256sums=('93c6bc604cb8d6bea851a73f8de92364771aa84f8ccdd516ad0a20870e951d7f'
            '12869b94cbf00457ee2cf322344690e590829bea4ec9d16c263feba1e3c5df64'
            'e86746d0c42a0ae8424090508927c9cbc7de460922cc7c857efa7ef93e9b33e3'
            'd8c010ae36e4160216fa34dfd4dbcc118e2b0bd1612e34a29deb184b292011fb')
prepare() {
  mv "${pkgname}-release-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}/src/vendor"

  # Copy necessary submodules into the vendor directory
  cp -Pr "${srcdir}/portaudio-binaries"/* portaudio-binaries
  cp -Pr "${srcdir}/stargate-sbsms"/* sbsms
  cp -Pr "${srcdir}/stargate-soundtouch"/* soundtouch
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
