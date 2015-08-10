# Maintainer: Facundo Tuesca  <facutuesca AT gmail DOT com>

pkgname=iscan-plugin-v330
pkgver=0.2.0
pkgrel=2
pkgdesc="iscan plugin for Epson Perfection Photo V330 scanners."
arch=('i686' 'x86_64')
url="http://www.epson.com"
license=('custom')
depends=('iscan')
makedepends=('rpmextract')
install=iscan-plugin-v330.install

if [ "$CARCH" = "i686" ] ; then
  source=(http://download.ebz.epson.net/dsc/f/01/00/01/92/57/3e446b62d78d7c543b4247ef538a046279746f81/esci-interpreter-perfection-v330-${pkgver}-${pkgrel}.i386.rpm)
	ARCH=i386
	md5sums=('b138b5c9b01a3a2986c957d28d3c8441')

elif [ "$CARCH" = "x86_64" ] ; then
	source=(http://download.ebz.epson.net/dsc/f/01/00/01/92/57/21985c1cf99b6addcc31e4567f45bd4590146793/esci-interpreter-perfection-v330-${pkgver}-${pkgrel}.x86_64.rpm)
	ARCH=x86_64
	md5sums=('4aef1dacc55f257f25f5c73cbdf6e3ed')
fi

build() {
	cd "$srcdir"
	rpmextract.sh "esci-interpreter-perfection-v330-${pkgver}-${pkgrel}.$ARCH.rpm"
  
  if [ "$CARCH" = "x86_64" ] ; then
    mv usr/lib64 usr/lib
  fi
  
	mv usr "$pkgdir"
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mv $pkgdir/usr/share/doc/esci-interpreter-perfection-v330-${pkgver}/AVASYSPL.en.txt $pkgdir/usr/share/licenses/$pkgname
	rm -rf $pkgdir/usr/share/doc
}
