# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=rawsource26
pkgname=avisynth-plugin-${_plug}-git
pkgver=0.0.1.5.g1c0e215
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/RawSource_2.6x'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/RawSource_2.6x.git")
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

  cmake "../${_plug}/build" \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  install -Dm755 build/librawsourceplus.so "${pkgdir}/usr/lib/avisynth/librawsourceplus.so"

#   install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}
