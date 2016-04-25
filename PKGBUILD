# Maintainer: neXyon <nexyon at gmail dot com>

pkgname=piranha-git
pkgver=0.1.3524.c99d233
pkgrel=1
pkgdesc="Piranha is a C++11-based computer algebra library for the manipulation of algebraic objects, such as polynomials and Poisson series, commonly encountered in celestial mechanics."
arch=('i686' 'x86_64')
url="https://github.com/bluescarni/piranha"
license=('LGPL3')
groups=()
depends=('python' 'boost' 'gmp' 'mpfr' 'bzip2')
makedepends=('gcc' 'cmake' 'git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/bluescarni/piranha.git")
md5sums=('SKIP')
noextract=()
_gitname="piranha"

pkgver() {
  cd $_gitname

  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)

  echo 0.1.$revision.$hash
}

build() {
  mkdir -p build
  cd build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_PYRANHA=ON \
    -DBUILD_TESTS=OFF || return 1

  make $MAKEFLAGS || return 1
}

package() {
  cd build
  make DESTDIR="$pkgdir" install || return 1
}

