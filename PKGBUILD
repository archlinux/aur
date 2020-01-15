# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=aspcud
pkgver=1.9.4
pkgrel=4
pkgdesc='Solver for package dependencies'
arch=('x86_64')
url='https://potassco.org/aspcud'
license=('GPL3')
makedepends=('boost' 'cmake' 'git' 'ninja' 're2c')
depends=('clingo')
source=("git+https://github.com/potassco/$pkgname#tag=v$pkgver")
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DCUDF2LP_LOC=cudf2lp \
    -DGRINGO_LOC=gringo \
    -DCLASP_LOC=clasp \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et:
