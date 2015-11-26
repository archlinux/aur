# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: garion < garion at mailoo.org >

pkgname=iscan-plugin-gt-f670
_pkgname=iscan-gt-f670-bundle
pkgver=2.1.2
_pkgver=1.0.0
pkgrel=5
pkgdesc="iscan plugin for Epson Perfection Photo V200 scanners and similar"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=('iscan')
install=gt-f670.install
changelog=ChangeLog

if [ "$CARCH" = "i686" ]; then
  _ARCH=i386
  _ARCH2=x86
  source=("https://download2.ebz.epson.net/iscan/plugin/gt-f670/deb/x86/iscan-gt-f670-bundle-$_pkgver.x86.deb.tar.gz")
  md5sums=('5c5029414f00bbc0bfa461711a170fdc')
elif [ "$CARCH" = "x86_64" ]; then
  _ARCH=amd64
  _ARCH2=x64
  source=("https://download2.ebz.epson.net/iscan/plugin/gt-f670/deb/x64/iscan-gt-f670-bundle-$_pkgver.x64.deb.tar.gz")
  md5sums=('abaae6c367bdcde8113b5e12d1fd1ca8')
fi

build(){
  cd $srcdir/$_pkgname-$_pkgver.$_ARCH2.deb/plugins/
  ar vx $pkgname"_"$pkgver"-1_"$_ARCH.deb
  tar -zxvf data.tar.gz
}

package(){
 cd $srcdir/$_pkgname-$_pkgver.$_ARCH2.deb/plugins/
  install -d $pkgdir/usr/lib/iscan
  install -m755 usr/lib/iscan/libesint7A.so.2.0.1 $pkgdir/usr/lib/iscan/
  install -m755 usr/lib/iscan/libesint7A.so.2 $pkgdir/usr/lib/iscan/
  install -m755 usr/lib/iscan/libesint7A.so $pkgdir/usr/lib/iscan/
  install -d $pkgdir/usr/share/iscan
  install -m644 usr/share/iscan/esfw7A.bin $pkgdir/usr/share/iscan
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 usr/share/doc/$pkgname/{AVASYSPL.en.txt,AVASYSPL.ja.txt,copyright} $pkgdir/usr/share/licenses/$pkgname/
}
