# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mpeg2decplus
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.2.0.3.gf8b68fe
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/MPEG2DecPlus'
license=('LGPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/MPEG2DecPlus.git")
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
  install -Dm755 build/libmpeg2decplus.so "${pkgdir}/usr/lib/avisynth/libmpeg2decplus.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}
