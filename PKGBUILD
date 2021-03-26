# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fft3dfilter
pkgname=avxsynth-plugin-${_plug}-git
pkgver=20120611.5c2028d
pkgrel=1
pkgdesc="Plugin for Avxsynth. ${_plug} (GIT Version)"
arch=('x86_64')
url="https://github.com/fundies/fft3dfilter-linux"
license=('GPL')
depends=('avxsynth'
         'fftw'
         )
makedepends=('git')
provides=("avxsynth-plugin-${_plug}")
conflicts=("avxsynth-plugin-${_plug}")

source=("${_plug}::git+https://github.com/sl1pkn07/fft3dfilter-linux.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${_plug}"
  make
}

package(){
  cd "${_plug}"
  install -Dm775 fft3dfilter.so "${pkgdir}/usr/lib/avxsynth/fft3dfilter.so"
  install -Dm664 README "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/README"
}

