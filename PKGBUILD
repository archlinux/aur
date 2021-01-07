# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=masktools2
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.2.26.4.gbb9795d
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/masktools'
license=('custom')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/masktools.git")
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

  install -Dm644 "${_plug}/masktools/documentation/mt_masktools.html" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/mt_masktools.html"
  install -Dm644 "${_plug}/masktools/documentation/avisynth.css" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/avisynth.css"

  install -Dm644 "${_plug}/LICENSE"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
