# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cereal
pkgver=1.2.1
pkgrel=1
pkgdesc='A C++11 library for serialization'
arch=('i686' 'x86_64')
url='https://github.com/USCiLab/cereal'
license=('BSD')
depends=('')
makedepends=('boost' 'cmake')
source=("cereal-${pkgver}.tar.gz::https://github.com/USCiLab/cereal/archive/v${pkgver}.tar.gz")
sha256sums=('7d321c22ea1280b47ddb06f3e9702fcdbb2910ff2f3df0a2554804210714434e')

prepare() {
  cd cereal-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd cereal-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=unused-variable"
  make
}

package() {
  cd cereal-${pkgver}/build

  make DESTDIR="${pkgdir}" install

  install -Dm 644 ../LICENSE -t "${pkgdir}"/usr/share/licenses/cereal/
}

# vim: ts=2 sw=2 et:
