# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=libolm
_pkgname=olm
pkgver=3.1.3
pkgrel=1
pkgdesc='An implementation of the Double Ratchet cryptographic ratchet in C++'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.matrix.org/matrix-org/olm"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://gitlab.matrix.org/matrix-org/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha512sums=('605a9793f8c968c6bbaae6de87f831b9c330810183a1b1b87227cbddc70ca796b869b9f800480035b0de458546b2fbcbaf4bc8e239a582fe261f13f845c9a750')

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
