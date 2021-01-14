# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cryfa-git
pkgver=20.04.r1.g4f6020a
pkgrel=1
pkgdesc="A secure encryption tool for genomic data"
arch=('i686' 'x86_64')
url="https://github.com/cobilab/cryfa"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('cryfa')
conflicts=('cryfa')
source=("git+https://github.com/cobilab/cryfa.git")
sha256sums=('SKIP')


pkgver() {
  cd "cryfa"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "cryfa"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "cryfa"

  install -Dm755 "_build/cryfa" -t "$pkgdir/usr/bin"
  install -Dm755 "_build/keygen" "$pkgdir/usr/bin/cryfa-keygen"
}
