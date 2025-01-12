# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor:  Martin Sandsmark <martin.sandsmark@kde.org>

_plug=removelogo
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.0.g2d7fec6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Noctem/vapoursynth-removelogo'
license=('LGPL-2.1-or-later')
depends=(
  'vapoursynth'
  'glibc' # libc.so
)
makedepends=(
  'meson'
  'git'
)
provides=(
  "vapoursynth-plugin-${_plug}"
  "vapoursynth-plugin-${_plug}-hg"
)
conflicts=(
  "vapoursynth-plugin-${_plug}"
  "vapoursynth-plugin-${_plug}-hg"
)
source=("${_plug}::git+https://github.com/Noctem/vapoursynth-removelogo.git")
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
}
