# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gflags-git
pkgver=2.2.1.r2.gaa2d0f7
pkgrel=1
pkgdesc="C++ Library for commandline flag processing"
arch=('i686' 'x86_64')
url="https://github.com/gflags/gflags"
license=('BSD')
makedepends=('git' 'cmake')
provides=('gflags')
conflicts=('gflags')
options=('staticlibs')
source=("git+https://github.com/gflags/gflags.git")
sha256sums=('SKIP')


prepare() {
  cd "gflags"

  mkdir -p "build"
}

pkgver() {
  cd "gflags"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gflags/build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DREGISTER_INSTALL_PREFIX=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_TESTING=ON ../
  make
}

check() {
  cd "gflags/build"

  make test
}

package() {
  cd "gflags/build"

  make DESTDIR="$pkgdir" install
  install -D -m644 "../COPYING.txt" "$pkgdir/usr/share/licenses/gflags/COPYING.txt"
}
