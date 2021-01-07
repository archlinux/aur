# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvtools2
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.7.44.27.g76c676e
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/mvtools'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/mvtools.git")
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

  install -Dm644 "${_plug}/Documentation/avisynth-new.css" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/avisynth-new.css"
  install -Dm644 "${_plug}/Documentation/avisynth.css" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/avisynth.css"
  install -Dm644 "${_plug}/Documentation/mvtools2.html"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/mvtools2.html"

  install -Dm644 "${_plug}/Doc_Depan/depan.html"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/depan.html"
  install -Dm644 "${_plug}/Doc_DepanEstimate/depan.html"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/depanestimate.html"
}
