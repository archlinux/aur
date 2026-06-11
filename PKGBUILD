# Maintainer: Lehel Gyuro <lehel@freemail.hu>
# Contributor: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libqsi
pkgver=2.2.2
pkgrel=1
pkgdesc="libqsi used by INDI QSI drivers. Please note that for sake of simplicity package version follows libindi versionning."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64 aarch64)
depends=(gcc-libs glibc libftdi)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("ea4e90f3549cb28860d0d2a5820734579d4aa5b8c04ba202bc413ce5ffdb0377")

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
