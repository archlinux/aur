# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bestaudiosource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r37.87d6cba
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?p=1896898'
license=('GPL')
depends=('vapoursynth'
         'libavcodec.so'
         'libavformat.so'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/bestaudiosource.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
}
