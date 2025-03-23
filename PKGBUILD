# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu-git
pkgver=3.3.1.r6.g8e4e5c4
pkgrel=2
pkgdesc="ncurses interface for QEMU"
arch=(x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD-2-Clause)
depends=(qemu ncurses sqlite json-c libxml2 libarchive glibc sh)
makedepends=(git cmake)
provides=(nemu)
conflicts=(nemu)
source=("git+https://github.com/nemuTUI/nemu.git")
sha256sums=('SKIP')

pkgver() {
  cd nemu
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "nemu" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 nemu/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
