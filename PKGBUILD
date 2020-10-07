# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libzip-git
pkgver=1.7.3.r79.g72b3722d
pkgrel=2
pkgdesc="C library for reading, creating, and modifying zip archives"
arch=('i686' 'x86_64')
url="https://libzip.org/"
license=('BSD')
depends=('glibc' 'bzip2' 'gnutls' 'openssl' 'xz' 'zlib' 'zstd')
makedepends=('git' 'cmake')
provides=('libzip')
conflicts=('libzip')
source=("git+https://github.com/nih-at/libzip.git")
sha256sums=('SKIP')


pkgver() {
  cd "libzip"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libzip"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "libzip"

  make -C "_build" check
}

package() {
  cd "libzip"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libzip"
}
