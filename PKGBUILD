# Maintainer: Christoph Haag <haagch+serial@frickel.club>

pkgname="serial-git"
pkgver=r368.5a354ea
pkgrel=1
pkgdesc="cross-platform library for interfacing with rs-232 serial like ports written in C++"
arch=('x86_64')
url="https://github.com/wjwwood/serial"
license=('MIT')
makedepends=('git' 'cmake')
conflicts=()
provides=()
source=("git+https://github.com/wjwwood/serial.git"
	"CMakeLists.txt")
sha512sums=('SKIP'
            '456e32c00e52bbbcc470f4f822fa488a88314e690f6419527107738e6fa18b226f74d7ba9907d0a569c60892619140b7269425ac8fa3e4339bef3bffea3e8ad6')

pkgver() {
  cd serial
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp "$srcdir/CMakeLists.txt" serial
}

build() {
  mkdir -p serial-build
  cd serial-build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/ ../serial

  make
}

package() {
  cd serial-build

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
