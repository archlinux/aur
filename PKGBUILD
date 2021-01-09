# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=removedirt
pkgname=avisynth-plugin-${_plug}-git
pkgver=v0.9.2.26.g2952af0
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/RemoveDirt'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/RemoveDirt.git")
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

  cmake "../${_plug}" \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/RemoveDirt/documentation/RemoveDirt.htm" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/RemoveDirt.htm"
}
