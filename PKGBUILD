# Maintainer: Simon Repp <simon@fdpl.io>

arch=('i686' 'x86_64')
depends=('icu')
license=('LGPL3')
makedepends=('meson')
md5sums=('aa773b3ead156cc8a1e0077f12b34c85')
pkgdesc="C reference parsing library for eno notation"
pkgname=libeno
pkgrel=1
pkgver=0.1.0
provides=('libeno.so')
url="https://eno-lang.org"

source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/simonrepp/libeno/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}"/libeno
  rm -rf build
  meson --buildtype release --prefix /usr build
  cd build
  meson compile
}

package() {
  cd "${srcdir}"/libeno/build
  DESTDIR="${pkgdir}" meson install
}
