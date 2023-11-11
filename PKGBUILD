# Maintainer: Klaus H. <k-laus@mailbox.org>

pkgname=libindi-asi-git
pkgver=v2.0.4.16.g0c0de320
pkgrel=1
pkgdesc='3rd party drivers for INDI, support for ZWO devices: ASI cameras, EFW filter wheel, ASI ST4 port and ASI focuser, latest git version.'
url='https://www.indilib.org/index.php?title=Main_Page'
license=(LGPL2.1)
arch=(aarch64 i686 x86_64)
depends=('libasi')
makedepends=(cmake)
provides=('libindi-asi')
conflicts=('libindi-asi')
source=('git+https://github.com/indilib/indi-3rdparty')
sha512sums=('SKIP')

prepare() {
  mkdir -p build
}

pkgver() {
  cd "indi-3rdparty"
  git describe --long --tags | sed 's/-/./;s/-/./'
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    ../indi-3rdparty/indi-asi
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
