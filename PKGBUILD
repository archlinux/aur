# Maintainer: Your Name <youremail@domain.com>
pkgname=epson-tm-series-driver
pkgver=2.0.2.0
pkgrel=1
pkgdesc="TM Series Printer Driver for Linux"
arch=('x86_64') # if you want 32-bit, modify the PKGBUILD
url="https://download.epson-biz.com/modules/pos/index.php?page=single_soft&cid=4547&pcat=3&pid=3495"
depends=('libcups')
license=('custom')
# Download from https://download.epson-biz.com/modules/pos/index.php?page=single_soft&cid=4547&pcat=3&pid=3495 , I can't get a direct download link
source=("local://tmx-cups-$pkgver.tar.gz")
md5sums=('a99b97bedeb8efa0892090eaf736daf9')

prepare() {
	cd $srcdir/tmx-cups/filter/
	ar vx tmx-cups_1.2.1-1_amd64.deb
	tar -zxvf data.tar.gz
}

package() {
	cd $srcdir/tmx-cups/
	mkdir -p $pkgdir/usr/share/cups/model/
	
	cp ppd/* $pkgdir/usr/share/cups/model/
	cp -R filter/usr $pkgdir
}
