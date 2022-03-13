# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tbilateral
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.0.gcdde360
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (Fork)(GIT version)"
arch=('x86_64')
url='https://github.com/dubhater/vapoursynth-tbilateral'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-tbilateral.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
