# Maintainer: Lehel Gyuro <lehel@freemail.hu>
# Contributor: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor Lehel Gyuro <lehel@freemail.hu>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-eqmod
pkgver=2.1.4
pkgrel=1
pkgdesc="3rd party drivers for INDI: EQMod"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL3)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver})
makedepends=(cmake)
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
    ../indi-3rdparty-${pkgver}/indi-eqmod/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
