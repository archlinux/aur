# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=3.4.0
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=(x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD-2-Clause)
depends=(qemu ncurses sqlite json-c libxml2 libarchive glibc sh)
makedepends=(git cmake)
source=("git+https://github.com/nemuTUI/nemu.git#tag=v${pkgver}")
sha256sums=('a55ed3cf0d1c102db09c4169b9ef33b5264045bc27660d9032c72bd7ae3f5485')

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
