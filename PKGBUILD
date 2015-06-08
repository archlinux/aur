# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fft3dfilter
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r22.b023e21
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/VFR-maniac/VapourSynth-FFT3DFilter"
license=('GPL')
depends=('vapoursynth' 'fftw')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/VFR-maniac/VapourSynth-FFT3DFilter.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "r$(git rev-list HEAD 2> /dev/null | wc -l | sed 's/ //g').$(git describe --always)"
}

prepare() {
  rm "${_plug}/VapourSynth.h"
}

build() {
  cd "${_plug}"
  ./configure --prefix=/usr --extra-cxxflags="$(pkg-config --cflags vapoursynth)"
  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
#   install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
