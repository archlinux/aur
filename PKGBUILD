# Maintainer: Bertrand Lemasle <blemasle@gmail.com>

pkgname=libindi-astrolink4usb-git
pkgver=r24.97e0ea1
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for Astrolink 4 USB device"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL3)
arch=(i686 x86_64)
depends=(libindi=1.9.4)
makedepends=(git cmake)
source=("git+https://github.com/astrojolo/astrolink4usb.git")
sha256sums=('SKIP')

pkgver() {
  cd astrolink4usb
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build  
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../astrolink4usb
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
