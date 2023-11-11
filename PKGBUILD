# Maintainer: Klaus H. <k-laus@mailbox.org>

pkgname=libasi-git
pkgver=v2.0.4.16.g0c0de320
pkgrel=1
pkgdesc='libasi used by INDI ASI drivers, latest git version.'
url='https://www.indilib.org/index.php?title=Main_Page'
license=(MIT)
arch=(aarch64 i686 x86_64)
depends=()
makedepends=(cmake)
provides=('libasi')
conflicts=('libasi')
source=('git+https://github.com/indilib/indi-3rdparty')
sha512sums=('SKIP')
#options=("")

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
    ../indi-3rdparty/libasi
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
