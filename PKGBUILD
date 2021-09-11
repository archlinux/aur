# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=3.0.0
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=(i686 x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD)
depends=(qemu ncurses sqlite udev libusb)
makedepends=(cmake)
source=("${pkgname}-$pkgver.tar.bz2::https://github.com/nemuTUI/nemu/archive/v${pkgver}.tar.gz")
sha256sums=('4a7ba85d6e5944a83f04184bfbb82ea1be1401e704448ef3f1fa721adccf8091')

prepare() {
  cd "${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
