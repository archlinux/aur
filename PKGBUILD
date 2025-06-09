# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-toupbase
pkgver=2.1.4
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-toupbase"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libtoupcam=${pkgver} libbressercam=${pkgver} libmeadecam=${pkgver} libogmacam=${pkgver} libstarshootg=${pkgver} libtscam=${pkgver} libomegonprocam=${pkgver} libnncam=${pkgver} libaltaircam=${pkgver} libmallincam=${pkgver} libsvbonycam=${pkgver})
makedepends=(cmake libtoupcam=${pkgver} libbressercam=${pkgver} libmeadecam=${pkgver} libogmacam=${pkgver} libstarshootg=${pkgver} libtscam=${pkgver} libomegonprocam=${pkgver} libnncam=${pkgver} libaltaircam=${pkgver} libmallincam=${pkgver} libsvbonycam=${pkgver})
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("e9ab43d08d09555d2c9d3c658d1bcc3130c3465a3afe2300995fba0d6e737080")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-toupbase
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
