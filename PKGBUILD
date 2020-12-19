# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=2.5.0
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=(i686 x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD)
depends=(qemu ncurses sqlite udev libusb)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.bz2::https://github.com/nemuTUI/nemu/archive/v${pkgver}.tar.gz"
		"https://bitbucket.org/PascalRD/$pkgname/raw/1e73a64638ef804f0e241e89aeb31305eb4f602d/LICENSE")
sha256sums=('ca4d8db264dedb0440155329edf6720183dc597f06594967ae7248364ed077ee'
            '0853b096d8bc114f9e17a36939192982eb4440a15a00bb375a45bd6d27cd3210')

prepare() {
  cd "${pkgname}-${pkgver}"
  install -d build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
