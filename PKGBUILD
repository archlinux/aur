# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=3.3.1
pkgrel=3
pkgdesc="ncurses interface for QEMU"
arch=(x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD-2-Clause)
depends=(qemu ncurses sqlite json-c libxml2 libarchive glibc sh)
makedepends=(git cmake)
source=("git+https://github.com/nemuTUI/nemu.git#tag=v${pkgver}")
sha256sums=('76e63121d68ede54b4274d6918a3344a46fc65420b0744947029f95076c2a193')

build() {
  cmake -B build -S "nemu" -Wno-dev \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 nemu/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
