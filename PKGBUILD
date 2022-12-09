# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=3.2.0
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=(i686 x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD)
depends=(qemu ncurses sqlite udev libusb json-c libxml2 libarchive bash)
makedepends=(git cmake)
source=("git+https://github.com/nemuTUI/nemu.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
