# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=2.3.0
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=(i686 x86_64)
url="https://bitbucket.org/PascalRD/nemu"
license=(BSD)
depends=(qemu ncurses sqlite udev libusb)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/PascalRD/$pkgname/get/v$pkgver.tar.bz2"
		"https://bitbucket.org/PascalRD/$pkgname/raw/1e73a64638ef804f0e241e89aeb31305eb4f602d/LICENSE")
sha256sums=('28bd8b9bf591ec73b0bcf34f199617626d5e93961255ca0893eec9910b857742'
            '0853b096d8bc114f9e17a36939192982eb4440a15a00bb375a45bd6d27cd3210')

prepare() {
  cd "PascalRD-nemu-ddddcdf0cf9c"
  mkdir build
}

build() {
  cd "PascalRD-nemu-ddddcdf0cf9c/build"
  cmake ../
  make
}

package() {
  cd "PascalRD-nemu-ddddcdf0cf9c/build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
