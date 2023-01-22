# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=addgrainc
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.8.4.0.g7e280a2
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/AddGrainC'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/AddGrainC.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake "../${_plug}" \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/Documentation/AddGrainC.txt" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/AddGrainC.txt"
  install -Dm644 "${_plug}/Documentation/addgrain.avs"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/addgrainc.avs"
}
