# Maintainer: Raresh Nistor <raresh@nistor.email>
pkgname=satodriver-bin
pkgver=2.32.0
pkgrel=1
pkgdesc='SATO Cups Driver for Linux'
arch=('x86_64')
url='https://www.satoamerica.com/support_downloads/software/printer-drivers-linux/'
license=('custom:Software License Agreement')

makedepends=('unzip' 'tar' 'gzip')
optdepends=('cups: print server')

options=('!strip')

source=('SATOLinuxDriver_x64.zip::https://www.sato-global.com/files/Printer_Drivers/SATO_CUPS_Driver/Linux/SATOLinuxDriver_x64.zip')
sha256sums=('b4f4305ada565ded3cc5553c79ef2bd0759489d23a26d2c652d529d9416dab13')
noextract=('SATOLinuxDriver_x64.zip')

package() {
	unzip -d zip SATOLinuxDriver_x64.zip
	mkdir src
	tar -xf zip/satodriver-$pkgver-linux-4.15-x86_64.tar.gz -C src
	
	gunzip -ck src/satodriver.sw | tar -xf - -C "$pkgdir/"
	gunzip -ck src/satodriver.ss | tar -xf - -C "$pkgdir/"

	install -Dm644 src/satodriver.license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
