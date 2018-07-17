# Maintainer: heliochronix <heliochronix@gmail.com>

pkgname=libfec-git
pkgver=1.0.r10.g9750ca0
pkgrel=1
pkgdesc="Phil Karn's FEC (Forward Error Correction) library"
arch=('x86_64' 'aarch64')
url="https://github.com/quiet/libfec"
license=('LGPL2.1')
makedepends=('git' 'cmake')
provides=('libfec')
conflicts=('libfec')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd libfec

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p libfec/build
  cd libfec/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

check() {
  cd libfec/build

  make test_all
}

package() {
  cd libfec/build

  make DESTDIR="$pkgdir" install
}
