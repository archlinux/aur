# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=avisynthplus-git
pkgver=v3.5.0.0.ge17f4f80
pkgrel=1
pkgdesc="Avisynth+"
arch=('x86_64')
url='http://avs-plus.net'
license=('GPL')
depends=('gcc-libs')
makedepends=('git'
             'cmake'
             )
source=('avisynthplus::git+https://github.com/AviSynth/AviSynthPlus.git')
sha256sums=('SKIP')

pkgver() {
  cd avisynthplus
  echo $(git describe --long --tags | tr - .)
}

prepare() {
  mkdir -p build
}

build() {
  CXXFLAGS+=' -fpermissive'

  cd build
  cmake ../avisynthplus \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
