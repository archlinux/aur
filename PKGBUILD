# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libtscam
pkgver=2.2.3.1
pkgrel=1
pkgdesc="INDI driver for products manufactured by tscam"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(glibc)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("bb2b25b09f57be7c1aaad6226802b9f0083b415b93046c7fcbde55237410134a")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/libtscam/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
