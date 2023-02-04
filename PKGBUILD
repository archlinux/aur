# Maintainer: Bertrand Lemasle <blemasle@gmail.com>

pkgname=libindi-astrolink4usb-git
pkgver=2.0.0.r33.0022661
_libindiver=2.0.0
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for Astrolink 4 USB device"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL3)
arch=(i686 x86_64)
depends=(libindi=${_libindiver})
makedepends=(git cmake)
source=("git+https://github.com/astrojolo/astrolink4usb.git")
sha256sums=('SKIP')

pkgver() {
  cd astrolink4usb
  printf "%s.r%s.%s" "${_libindiver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
