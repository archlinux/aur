# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-toupbase
pkgver=2.1.3
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-toupbase"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libtoupcam=${pkgver} libbressercam=${pkgver} libmeadecam=${pkgver} libogmacam=${pkgver} libstarshootg=${pkgver} libtscam=${pkgver} libomegonprocam=${pkgver} libnncam=${pkgver} libaltaircam=${pkgver} libmallincam=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("bcb7cf2b9053c5b1e052a35247ec499a9d513f4ed257178b244c190394d0daa6")

prepare() {
  mkdir -p build
  cd indi-3rdparty-${pkgver}
  sed -i -e '/option(WITH_.*On)$/s/ On)$/ Off)/' CMakeLists.txt
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    -DWITH_TOUPBASE=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
