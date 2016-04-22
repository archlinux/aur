# Maintainer: TJM <tommy.mairo@gmail.com>
pkgname=rtl8192eu
pkgver=4.3.1.1
pkgrel=1
pkgdesc="Driver for the Realtek8192eu chipset."
arch=("x86_64")
url="https://github.com/Mange/rtl8192eu-linux-driver"
license=('GPL')
depends=("dkms")
makedepends=('linux-headers' 'git')
source=("git+https://github.com/Mange/rtl8192eu-linux-driver.git#commit=a322c84595b526fc27b979109998188b4ff8042e")
install=${pkgname}.install
md5sums=('SKIP')

build() {
	
	cd "rtl8192eu-linux-driver"
	make
}
prepare(){
	cd "rtl8192eu-linux-driver"
	sed -i '1341i\	install -d $(MODDESTDIR)' Makefile
	sed -i 's/$(MODDESTDIR)/$(DESTDIR)$(MODDESTDIR)/g' Makefile
}
package() {
	cd "rtl8192eu-linux-driver"
	make DESTDIR="$pkgdir/usr/" install
}
