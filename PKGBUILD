# Maintainer: lain <aur@hacktheinter.net>
pkgname=xtrx-xc3sprog-git
pkgver=r813.d97d672
pkgrel=1
pkgdesc="Suite of utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters under Linux. Special branch for XTRX over USB3 adapter"
provides=("${pkgname%-git}")
conflicts=('xc3sprog' 'xc3sprog-svn')
arch=('i686' 'x86_64')
url='https://github.com/xtrx-sdr/xc3sprog'
md5sums=('SKIP')
license=('GPL')
depends=('libftdi-compat' 'libusb3380-git')
makedepends=('git' 'cmake')
source=('git+https://github.com/xtrx-sdr/xc3sprog.git')

pkgver() {
  cd xc3sprog
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd xc3sprog
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "xc3sprog/build"
  make DESTDIR="$pkgdir/" install
}
