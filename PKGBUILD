# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsakarin
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.92.5.g67cea7d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/akarinVS/vapoursynth-plugin.git'
license=('GPL')
depends=('vapoursynth'
         )
makedepends=('git'
             'meson'
             'llvm'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/akarinVS/vapoursynth-plugin.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  mkdir -p build
}

build() {
  cd build

  arch-meson "../${_plug}" \
    --buildtype=release

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
