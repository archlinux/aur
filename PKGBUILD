# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=2.2.1
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=(i686 x86_64)
url="https://bitbucket.org/PascalRD/nemu"
license=(BSD)
depends=(qemu glibc ncurses sqlite udev libusb)
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/PascalRD/$pkgname/get/v$pkgver.tar.bz2"
		"https://bitbucket.org/PascalRD/$pkgname/raw/1e73a64638ef804f0e241e89aeb31305eb4f602d/LICENSE")
sha256sums=('db881e39d94034d93251846f86696133635ea3859e9392adf27ced25cdb24e36'
            '0853b096d8bc114f9e17a36939192982eb4440a15a00bb375a45bd6d27cd3210')

prepare() {
  cd "PascalRD-nemu-61da59902bfe"
  mkdir build
}

build() {
  cd "PascalRD-nemu-61da59902bfe/build"
  cmake ../
  make
}

package() {
  cd "PascalRD-nemu-61da59902bfe/build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
