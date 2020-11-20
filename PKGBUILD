# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libssh2-git
pkgver=1.9.0.r83.gcfe0bf6
pkgrel=3
pkgdesc="Client-side C library implementing the SSH2 protocol"
arch=('i686' 'x86_64')
url="https://www.libssh2.org/"
license=('BSD')
depends=('glibc' 'openssl' 'zlib')
makedepends=('git' 'cmake')
provides=('libssh2' 'libssh2.so')
conflicts=('libssh2')
source=("git+https://github.com/libssh2/libssh2.git")
sha256sums=('SKIP')


pkgver() {
  cd "libssh2"

  git describe --long --tags | sed 's/^libssh2-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libssh2"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

check() {
  cd "libssh2"

  #make -C "_build" test
}

package() {
  cd "libssh2"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libssh2"
}
