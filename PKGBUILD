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
source=("git+https://github.com/Mange/rtl8192eu-linux-driver.git#commit=a322c84595b526fc27b979109998188b4ff8042e" "fix.patch")
sha256sums=("SKIP" "582f8e8f8bd513b598ada3a1ac625f188fbf313cddf018a440ca4cd8aaf9964c")
install=${pkgname}.install

build() {
	cd "rtl8192eu-linux-driver"
	make -j`cat /proc/cpuinfo |grep "processor"|wc -l`
}
prepare(){
	cd "rtl8192eu-linux-driver" 
	patch Makefile<../fix.patch
}
package() {
	mkdir -p $pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/net/wireless
	cd "rtl8192eu-linux-driver"
	make DESTDIR="$pkgdir/usr" install
}
