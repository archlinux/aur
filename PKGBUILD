# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=beziercurve
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.13.geadfc13
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/kewenyu/VapourSynth-BezierCurve'
license=('GPL2')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/kewenyu/VapourSynth-BezierCurve.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  mkdir build
  cd build
  meson .. \
   --prefix="${EPREFIX}/usr" \
   --buildtype=plain
}

build() {
  cd "${_plug}/build"

  ninja -v
}

package(){
  cd "${_plug}/build"
  DESTDIR="${pkgdir}" ninja install
}
