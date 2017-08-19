# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libssh-git
pkgver=0.3.0.r2774.gb9b89ef7
pkgrel=2
pkgdesc="Multiplatform C library implementing the SSHv2 and SSHv1 protocol on client and server side"
arch=('i686' 'x86_64')
url="https://www.libssh.org/"
license=('LGPL')
depends=('glibc' 'openssl' 'zlib')
makedepends=('git' 'cmake' 'cmocka')
provides=('libssh')
conflicts=('libssh')
options=('staticlibs')
source=("git://git.libssh.org/projects/libssh.git")
sha256sums=('SKIP')


prepare() {
  cd "libssh"

  mkdir -p "_build"
}

pkgver() {
  cd "libssh"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libssh/_build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DWITH_TESTING=ON -DWITH_ZLIB=ON ../
  make
}

check() {
  cd "libssh/_build"

  make test
}

package() {
  cd "libssh/_build"

  make DESTDIR="$pkgdir" install
}
