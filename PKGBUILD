# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libqsi
pkgver=2.1.1
pkgrel=1
pkgdesc="libqsi used by INDI QSI drivers. Please note that for sake of simplicity package version follows libindi versionning."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64 aarch64)
depends=()
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("17ae94f77171887920f91a78e322de49e55cc24a068e86b1091fa50978d3a127")

prepare() {
  mkdir -p build
}

build() {
  cd build
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
