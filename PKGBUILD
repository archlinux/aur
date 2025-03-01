# Maintainer: Lehel Gyuro <lehel@freemail.hu>
# Contributor: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-asi
pkgver=2.1.2.1
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for ZWO devices: ASI cameras, EFW filter wheel, ASI ST4 port and ASI focuser"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libasi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("d29a667a5b9bf3b1d9be5f2ca81bfff5573e98a6941f764fd687d439e1b8abb6")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    ../indi-3rdparty-${pkgver}/indi-asi/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
