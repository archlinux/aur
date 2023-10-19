# Maintainer: cnf3rd <subs.in.tokyo@gmail.com>

_plug=adaptive-binarize
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.3.g655014b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/dnjulek/VapourSynth-AdaptiveBinarize.git'
license=('GPL')
depends=(
  'vapoursynth'
)
makedepends=(
  'git'
  'gcc'
  'binutils'
  'pkgconf'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dnjulek/VapourSynth-AdaptiveBinarize.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cd "${_plug}"
  gcc -shared $(pkg-config vapoursynth --cflags) src/adaptivebinarize.cpp $(pkg-config vapoursynth --libs) -O3 -o lib${_plug}.so
  strip lib${_plug}.so
}

package() {
  cd "${_plug}"

  install -Dm755 lib${_plug}.so ${pkgdir}/usr/lib/vapoursynth/plugins/lib${_plug}.so
}
