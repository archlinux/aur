# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=protozero
pkgver=1.6.3
pkgrel=1
pkgdesc="Minimalist protocol buffer decoder and encoder in C++"
url="https://github.com/mapbox/protozero"
arch=('any')
license=('custom')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapbox/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  ctest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('c5d3c71f5fb56d867ff0536e55cd7a3f2eb0d09f6ebbf636b0fde4f0e12552f5')
