# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fft3dfilter
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R2.0.g50194b4
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

  install -Dm644 fft3dfilter/doc/fft3dfilter.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/fft3dfilter.md"
}
