# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=libolm
_pkgname=olm
pkgver=3.1.0
pkgrel=1
pkgdesc='An implementation of the Double Ratchet cryptographic ratchet in C++'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.matrix.org/matrix-org/olm"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://gitlab.matrix.org/matrix-org/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha512sums=('9ee234902889ecbb816ce3fa7f1de7e438a4dfdbd0f55112c44fec75482a4cbe6614e2c81ec2e685046337ac53a444cbb46fdb899f43026cd6cda3f00f1242d2')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../"$_pkgname-$pkgver"
  make
}

check() {
  cd build/tests
  ctest .
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sts=2 sw=2 et:
