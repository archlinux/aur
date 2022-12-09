# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu-git
pkgver=3.2.0.r1.gf50ffbe
pkgrel=2
pkgdesc="ncurses interface for QEMU"
arch=(x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD)
depends=(qemu ncurses sqlite udev libusb libarchive)
makedepends=(git cmake)
provides=(nemu)
conflicts=(nemu)
source=("git+https://github.com/nemuTUI/nemu.git")
md5sums=('SKIP')

pkgver() {
  cd nemu
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd nemu
  [[ -d build ]] || mkdir build
}

build() {
  cd nemu/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd nemu/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
