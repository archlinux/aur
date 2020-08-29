# Maintainer: Philipp Lay <libeddsa@phlay.de>
pkgname=libeddsa-git
pkgver=0.6
pkgrel=1
pkgdesc="cryptographic library for ed25519 and x25519"
arch=('i686' 'x86_64')
url="https://github.com/phlay/libeddsa"
license=('public-domain')
depends=()
optdepends=()
makedepends=('cmake')
provides=('libeddsa')
conflicts=()
replaces=()
source=('git+https://github.com/phlay/libeddsa.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libeddsa"
  MAJOR=$(egrep -o "EDDSA_VERSION_MAJOR [[:digit:]]+" CMakeLists.txt | cut -f2 -d' ')
  MINOR=$(egrep -o "EDDSA_VERSION_MINOR [[:digit:]]+" CMakeLists.txt | cut -f2 -d' ')
  echo "$MAJOR.$MINOR"
}

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake "$srcdir/libeddsa" -DBUILD_TESTING=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd "$srcdir/build"
  ctest
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
