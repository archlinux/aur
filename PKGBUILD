# Maintainer: Facundo Tuesca  <facutuesca AT gmail DOT com>

pkgname=iscan-plugin-v330
pkgver=0.2.0
pkgrel=6
pkgdesc="iscan plugin for Epson Perfection Photo V330 scanners."
arch=('i686' 'x86_64')
url="http://www.epson.com"
license=('custom')
depends=('iscan')
makedepends=('rpmextract')
install=iscan-plugin-v330.install

if [ "$CARCH" = "i686" ] ; then
    source=(https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x86/iscan-perfection-v330-bundle-1.0.1.x86.rpm.tar.gz)
	ARCH=i386
    md5sums=('86006772843ebfb145c10c7d50a38307')

elif [ "$CARCH" = "x86_64" ] ; then
    source=(https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x64/iscan-perfection-v330-bundle-1.0.1.x64.rpm.tar.gz)
	ARCH=x86_64
    md5sums=('888a55ae8406730f1fe60a779f398316')
fi

build() {
	mv "$srcdir/iscan-perfection-v330-bundle-1.0.1.x64.rpm/plugins/esci-interpreter-perfection-v330-${pkgver}-1.$ARCH.rpm" "$srcdir/"
	rpmextract.sh "esci-interpreter-perfection-v330-${pkgver}-1.$ARCH.rpm"
  
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
