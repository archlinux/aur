_pkgname="libminiaudiohelpers"
pkgname=${_pkgname}
pkgver=5.0
pkgrel=1
pkgdesc="Mini audio helper library to facilitate audio in Raylib-cr"
arch=('x86_64')
url="https://github.com/sol-vin/raylib-cr"
license=('MIT')
makedepends=()
depends=('raylib')
provides=("libminiaudiohelpers.so=${pkgver}")
conflicts=()
epoch=1
source=("${_pkgname}_${pkgver}.tar.gz::https://github.com/sol-vin/raylib-cr/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('23f7a8d307ab51d6bfd8f3332f935ce3aa942a9afd5943659ae79da5bf2bdbba')

build() {
  cd "${srcdir}/raylib-cr-${pkgver}"
  gcc -c -fPIC rsrc/miniaudiohelpers/miniaudiohelpers.c -o miniaudiohelpers.o
  gcc miniaudiohelpers.o -shared -o libminiaudiohelpers.so -lm
}

package() {
  install -Dm644 "${srcdir}/raylib-cr-${pkgver}/libminiaudiohelpers.so" "${pkgdir}/usr/lib/libminiaudiohelpers.so"
}