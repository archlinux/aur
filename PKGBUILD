# Maintainer: Lehel Gyuro <lehel@freemail.hu>
# Contributor: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libqsi
pkgver=2.2.1.1
pkgrel=1
pkgdesc="libqsi used by INDI QSI drivers. Please note that for sake of simplicity package version follows libindi versionning."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64 aarch64)
depends=(gcc-libs glibc libftdi)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("b336df05a4e4313b02264e6cd59ecc78f0b37ac68eb895ffb617ae553a7db12a")

prepare() {
  mkdir -p build
}

build() {
  cd build
  sed -i "/include(CMakeCommon)/d" "../indi-3rdparty-${pkgver}/${pkgname}/CMakeLists.txt"
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    ../indi-3rdparty-${pkgver}/libqsi
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
