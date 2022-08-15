# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=aspcud
pkgver=1.9.6
pkgrel=1
pkgdesc='Solver for package dependencies'
arch=('x86_64')
url='https://potassco.org/aspcud'
license=('GPL3')
makedepends=('boost' 'cmake' 'git' 'ninja' 're2c')
depends=('clingo')
source=("https://github.com/potassco/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4dddfd4a74e4324887a1ddd7f8ff36231774fc1aa78b383256546e83acdf516c')

build() {
  mkdir -p build
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et:
