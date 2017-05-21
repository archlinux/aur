# Maintainer: Leo Pham <regretfulumbrella at gmail dot com>

pkgname=brother-mfc-9335cdw
pkgver=1.0.0
pkgrel=1
pkgdesc="LPR, scanner and CUPS drivers for the Brother MFC-9335CDW"
arch=("i686" "x86_64")
url="http://support.brother.com/g/s/id/linux/en/index.html"
license=("GPL" "unknown")
depends=("perl" "a2ps" "lib32-libcups" "brscan4")
install="brother-mfc-9335cdw.install"
source=(
	"http://download.brother.com/welcome/dlf102677/mfc9335cdwlpr-1.1.3-0.i386.deb"
	"http://download.brother.com/welcome/dlf102678/mfc9335cdwcupswrapper-1.1.4-0.i386.deb"
)
md5sums=("f993eb5322df2c9519a86ac0afcbb197"
         "f3afb684911c55a131532bb8cfdbc672"
)

package() {
	ar x mfc9335cdwlpr-1.1.3-0.i386.deb && tar xzvf data.tar.gz
	ar x mfc9335cdwcupswrapper-1.1.4-0.i386.deb && tar xzvf data.tar.gz

	cd opt/brother/Printers/mfc9335cdw
	perl -i -pe "s#/etc/init.d#/etc/rc.d#g" ./cupswrapper/cupswrappermfc9335cdw
	perl -i -pe "s#printcap\.local#printcap#g" ./inf/setupPrintcapij

	cp -rf $srcdir/usr/ $pkgdir/
	cp -rf $srcdir/opt/ $pkgdir/
}

