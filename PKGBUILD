# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fft3dfilter
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r22.b023e21
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/VFR-maniac/VapourSynth-FFT3DFilter'
license=('GPL')
depends=('vapoursynth' 'fftw')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/VFR-maniac/VapourSynth-FFT3DFilter.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr "${_plug}/VapourSynth.h"
}

build() {
  cd "${_plug}"
  ./configure --prefix=/usr \
              --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth)" \
              --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
#   install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
