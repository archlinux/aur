# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=3.3.1
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=(i686 x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD)
depends=(qemu ncurses sqlite json-c libxml2 libarchive glibc sh)
makedepends=(git cmake)
source=("git+https://github.com/nemuTUI/nemu.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
