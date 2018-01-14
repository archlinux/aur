# Maintainer: Facundo Tuesca  <facutuesca AT gmail DOT com>

pkgname=iscan-plugin-v330
pkgver=0.2.0
pkgrel=7
pkgdesc="iscan plugin for Epson Perfection Photo V330 scanners."
arch=('i686' 'x86_64')
url="http://www.epson.com"
license=('custom')
depends=('iscan')
install=iscan-plugin-v330.install
source_x86_64=(https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x64/iscan-perfection-v330-bundle-1.0.1.x64.rpm.tar.gz)
source_i686=(https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x86/iscan-perfection-v330-bundle-1.0.1.x86.rpm.tar.gz)
sha256sums_i686=('29e71557d7cd4b64bac8088c3f0f53459c5a5b72a92496ced98ea624bdac72c2')
sha256sums_x86_64=('f6fa455f04cdfbc3d38526573260746e9546830de93ba182d0365f557d2f7df9')

if [ "$CARCH" = "i686" ] ; then
	ARCH=i386
elif [ "$CARCH" = "x86_64" ] ; then
	ARCH=x86_64
fi

build() {
	mv "$srcdir/iscan-perfection-v330-bundle-1.0.1.x64.rpm/plugins/esci-interpreter-perfection-v330-${pkgver}-1.$ARCH.rpm" "$srcdir/"
	bsdtar -x -f "esci-interpreter-perfection-v330-${pkgver}-1.$ARCH.rpm"
  
  if [ "$CARCH" = "x86_64" ] ; then
    mv usr/lib64 usr/lib
  fi
}

package() {
	mv usr "$pkgdir"
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mv $pkgdir/usr/share/doc/esci-interpreter-perfection-v330-${pkgver}/AVASYSPL.en.txt $pkgdir/usr/share/licenses/$pkgname
	rm -rf $pkgdir/usr/share/doc
}
