# Maintainer: Marcs <aur (at) emarcs (dot) org>

pkgname=autowiring
pkgver=1.0.5
pkgrel=1
pkgdesc="An IoC framework for C++11. It provides a declarative way to manage resources through dependency injection."
arch=('i686' 'x86_64')
url="https://github.com/leapmotion/autowiring"
license=('Apache')
makedepends=('cmake')
source=("https://github.com/leapmotion/autowiring/archive/v${pkgver}.tar.gz")
sha256sums=('d358b5c074598036d2e1ca0158a36299178de1f76dd4f4d3eb0cdc02b1973c88')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./scripts/whitespace_check.sh
  ./scripts/copyright_check.sh
  ./scripts/version_number_updated.sh

  mkdir -p build
  cd build

  cmake .. \
	-DCMAKE_BUILD_TYPE=Debug \
	-DCMAKE_INSTALL_PREFIX:PATH=${pkgdir} \
	# -DCMAKE_CXX_FLAGS_RELEASE=-Werror
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"

  ctest --output-on-failure --timeout 30
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
