# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=libolm
_pkgname=olm
pkgver=3.1.4
pkgrel=1
pkgdesc='An implementation of the Double Ratchet cryptographic ratchet in C++'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.matrix.org/matrix-org/olm"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://gitlab.matrix.org/matrix-org/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha512sums=('87265d835ca7332d162bd3573dffdd09c8337c464dd673f100db9193e8ea4cedd8cb2a92cf2c34ad1b552a55bbbce8f87a47559ccfba03fa69b32fc7ff07f5f0')

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
