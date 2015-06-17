# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Thomas Oster <thomas.oster@rwth-aachen.de>

pkgname=libonion-git
pkgver=0.5.r253.g169fabc
pkgrel=1
pkgdesc='lightweight C library that facilitate to create simple HTTP servers'
arch=(i686 x86_64)
url='https://github.com/davidmoreno/onion/'
license=(LGPL)
makedepends=(git)
#options=(staticlibs)
source=(git://github.com/davidmoreno/onion)
sha1sums=('SKIP')

pkgver() {
  cd onion
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd onion
  mkdir build
  cd build
  cmake -DONION_USE_SYSTEMD=ON -DONION_USE_TESTS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/onion"
  make
}

# Tests are broken
#check() {
#  cd onion/build
#  make test
#}

package() {
  cd onion/build
  make DESTDIR="$pkgdir" install
}

