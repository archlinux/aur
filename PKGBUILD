# Maintainer:  Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=removelogo
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.0.g2d7fec6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Noctem/vapoursynth-removelogo'
license=(GPL)
depends=('vapoursynth')
makedepends=('meson' 'git')
provides=("vapoursynth-plugin-${_plug}"
          "vapoursynth-plugin-${_plug}-hg"
          )
conflicts=("vapoursynth-plugin-${_plug}"
           "vapoursynth-plugin-${_plug}-hg"
           )
source=("${_plug}::git+https://github.com/Noctem/vapoursynth-removelogo.git")
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
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install
}
