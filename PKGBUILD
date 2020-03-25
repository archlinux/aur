# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fft3dfilter
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R1.2.g8b30d06
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=175199'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/myrsloik/VapourSynth-FFT3DFilter.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}"

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

#   install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
