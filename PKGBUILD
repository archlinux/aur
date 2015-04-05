# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: garion < garion at mailoo.org >

pkgname=iscan-plugin-gt-f670
pkgver=2.1.2
pkgrel=4
pkgdesc="iscan plugin for Epson Perfection Photo V200 scanners and similar"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=('iscan')
install=gt-f670.install
changelog=ChangeLog

if [ "$CARCH" = "i686" ]; then
  _ARCH=i386
  source=("http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/37/ded8c1c031fd402e8f99f5ed9c8ca1cbefe1cdde/$pkgname"_"$pkgver-1_$_ARCH.deb")
  md5sums=('99edc10ae8c5712abdc8bf21ad99ade1')
elif [ "$CARCH" = "x86_64" ]; then
  _ARCH=amd64
  source=("http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/37/2057b553c5adcfd11876c3bd7e7da0974ad1b733/$pkgname"_"$pkgver-1_$_ARCH.deb")
  md5sums=('1492419f92b89be08be3e4438986bead')
fi

build(){
  cd $srcdir
  ar vx $pkgname"_"$pkgver-1_$_ARCH.deb
  tar -zxvf data.tar.gz
}

package(){
  install -d $pkgdir/usr/lib/iscan
  install -m755 $srcdir/usr/lib/iscan/libesint7A.so.2.0.1 $pkgdir/usr/lib/iscan/
  install -m755 $srcdir/usr/lib/iscan/libesint7A.so.2 $pkgdir/usr/lib/iscan/
  install -m755 $srcdir/usr/lib/iscan/libesint7A.so $pkgdir/usr/lib/iscan/
  install -d $pkgdir/usr/share/iscan
  install -m644 $srcdir/usr/share/iscan/esfw7A.bin $pkgdir/usr/share/iscan
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 $srcdir/usr/share/doc/$pkgname/{AVASYSPL.en.txt,AVASYSPL.ja.txt,copyright} $pkgdir/usr/share/licenses/$pkgname/
}
