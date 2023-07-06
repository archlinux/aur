# Contributor: Lex Black <autumn-wind@web.de>

_gitname=ubertooth
pkgname=ubertooth-git
pkgver=2020.12.R1.r33.ge0fd34d
pkgrel=1
pkgdesc="open source wireless development platform suitable for Bluetooth experimentation"
url="https://github.com/greatscottgadgets/ubertooth"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libbtbb-git' 'libusb' 'libpcap' 'python')
makedepends=('git' 'cmake')
source=(git+https://github.com/greatscottgadgets/ubertooth/)
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname/host/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "$_gitname/host/build/"
  make install
}
