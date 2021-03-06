# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: garion < garion at mailoo.org >

pkgname=iscan-plugin-gt-f670
_pkgname=iscan-gt-f670-bundle
pkgver=2.30.4
_pkgver=2.1.3
pkgrel=3
pkgdesc="iscan plugin for Epson Perfection Photo V200 scanners and similar"
arch=('x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EPSON')
depends=('iscan')
install=gt-f670.install
changelog=ChangeLog

_ARCH=amd64
_ARCH2=x64
source=("https://download2.ebz.epson.net/iscan/plugin/gt-f670/deb/x64/iscan-gt-f670-bundle-$pkgver.x64.deb.tar.gz")
md5sums=('9ebd8c4266da3e4d3bc46ebd21e89631')


build(){
  cd $srcdir/$_pkgname-$pkgver.$_ARCH2.deb/plugins/
  ar vx $pkgname"_"$_pkgver"-1_"$_ARCH.deb
  tar -zxvf data.tar.gz
  # licenses
  gunzip usr/share/doc/$pkgname/{COPYING.EPSON.en.txt,COPYING.EPSON.ja.txt}.gz
}

package(){
 cd $srcdir/$_pkgname-$pkgver.$_ARCH2.deb/plugins/
  install -d $pkgdir/usr/lib/iscan
  install -m755 usr/lib/iscan/libesint7A.so.2.0.1 $pkgdir/usr/lib/iscan/
  install -m755 usr/lib/iscan/libesint7A.so.2 $pkgdir/usr/lib/iscan/
  install -m755 usr/lib/iscan/libesint7A.so $pkgdir/usr/lib/iscan/
  install -d $pkgdir/usr/share/iscan
  install -m644 usr/share/iscan/esfw7A.bin $pkgdir/usr/share/iscan
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 usr/share/doc/$pkgname/{COPYING.EPSON.en.txt,COPYING.EPSON.ja.txt,copyright} $pkgdir/usr/share/licenses/$pkgname/
}
