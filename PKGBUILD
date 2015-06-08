# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=depan
pkgname=avxsynth-plugin-${_plug}-git
pkgver=1.11.0.1.ga5f2b95
pkgrel=1
pkgdesc="Plugin for Avxsynth. ${_plug} (GIT)"
arch=('i686' 'x86_64')
url="https://github.com/btb/depan"
license=('GPL')
depends=('avxsynth' 'fftw')
makedepends=('git' 'cmake')
provides=("avxsynth-plugin-${_plug}")
conflicts=("avxsynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/btb/depan.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | sed 's|depan-||g' | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${_plug}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
}

