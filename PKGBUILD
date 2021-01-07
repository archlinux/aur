# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=rgtools
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.1.0.g1311d1c
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/RgTools'
license=('MIT')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/RgTools.git")
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

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/${_plug}/README.md"
  install -Dm644 "${_plug}/RgTools/documentation/RgTools.txt" "${pkgdir}/usr/share/doc/${_plug}/RgTools.txt"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
