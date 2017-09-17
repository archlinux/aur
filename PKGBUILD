# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=nnedi3cl
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.0.g4b92a9f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL'
license=('GPL2')
depends=('vapoursynth'
         'ocl-icd'
         )
makedepends=('git'
             'opencl-headers'
             'boost'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  ./autogen.sh
}

build() {
  cd "${_plug}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
