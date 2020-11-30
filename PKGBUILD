# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libusb-git
pkgver=1.0.24.rc1.r0.g42ad1d1d
pkgrel=1
pkgdesc="A cross-platform library to access USB devices"
arch=('i686' 'x86_64')
url="https://libusb.info/"
license=('LGPL')
depends=('glibc' 'libudev.so')
makedepends=('git')
provides=('libusb' 'libusb-1.0.so')
conflicts=('libusb')
options=('staticlibs')
source=("git+https://github.com/libusb/libusb.git")
sha256sums=('SKIP')


pkgver() {
  cd "libusb"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libusb"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libusb"

  make check
}

package() {
  cd "libusb"

  make DESTDIR="$pkgdir" install
}
