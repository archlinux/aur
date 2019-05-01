# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=libolm
_pkgname=olm
pkgver=3.1.2
pkgrel=1
pkgdesc='An implementation of the Double Ratchet cryptographic ratchet in C++'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.matrix.org/matrix-org/olm"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://gitlab.matrix.org/matrix-org/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha512sums=('3b2d18a36a3445e799adcda0fe026e22a05ad71ded29f27a6eb172d86e6914412b4745be5067e1818c8f2885e1715092101f4a7ab076d02f76c4b59302a5a910')

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
