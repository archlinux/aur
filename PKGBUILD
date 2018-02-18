# Maintainer: Sergey Malkin  <adresatt@gmail.com>
pkgname=nemu
pkgver=1.4.0
pkgrel=2
pkgdesc="ncurses interface for QEMU"
arch=('i686' 'x86_64')
url="https://bitbucket.org/PascalRD/nemu"
license=('BSD')
depends=('qemu' 'glibc' 'ncurses' 'sqlite' 'udev' 'libusb')
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/PascalRD/$pkgname/get/v$pkgver.tar.bz2"
		"https://bitbucket.org/PascalRD/$pkgname/raw/1e73a64638ef804f0e241e89aeb31305eb4f602d/LICENSE")
md5sums=('44d004c35803423cbb7b1f9d0f00205b'
		 '08291868abd91097d16a154c2b344313')
		

build() {
	cd PascalRD-nemu-1e73a64638ef
	mkdir build
	cd build
	cmake ../
	make
}

package() {
	cd PascalRD-nemu-1e73a64638ef/build
	make DESTDIR="$pkgdir/" install
	cd $srcdir
	install -D -m644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
