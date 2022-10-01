# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=assrender
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.37.1.3.g84878b7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/AmusementClub/assrender.git'
license=('GPL2')
depends=('vapoursynth'
         'libass.so'
         )
makedepends=('git'
             'cmake'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/assrender.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}


build() {
  cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
