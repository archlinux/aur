# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=motionmask
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.0.g5de6eb3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

}

build() {
  ninja -C build
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}

