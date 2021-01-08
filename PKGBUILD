# Maintainer: Jan Korte <j.korte@me.com>

pkgname=iscan-plugin-gt-1500
_pkgname=iscan-gt-1500-bundle
pkgver=2.2.1
_pkgver=2.30.4
pkgrel=2
pkgdesc="iscan plugin for the Epson GT-1500 scanner"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
depends=('iscan')
install=gt-1500.install

if [ "$CARCH" = "i686" ]; then
  _ARCH=i386
  _ARCH2=x86
  source=("https://download2.ebz.epson.net/iscan/plugin/gt-1500/deb/x86/iscan-gt-1500-bundle-$_pkgver.x86.deb.tar.gz")
  md5sums=('5e9fe2f3fcf61b4d5ca854324475c7fc')
elif [ "$CARCH" = "x86_64" ]; then
  _ARCH=amd64
  _ARCH2=x64
  source=("https://download2.ebz.epson.net/iscan/plugin/gt-1500/deb/x64/iscan-gt-1500-bundle-$_pkgver.x64.deb.tar.gz")
  md5sums=('954e9c95e3ba3795e6244f5338be436c')
fi

build(){
  cd $srcdir/$_pkgname-$_pkgver.$_ARCH2.deb/plugins/
  ar vx $pkgname"_"$pkgver"-1_"$_ARCH.deb
  tar -zxvf data.tar.gz
}

package(){
 cd $srcdir/$_pkgname-$_pkgver.$_ARCH2.deb/plugins/
  install -d $pkgdir/usr/lib/iscan
  install -m755 usr/lib/iscan/libesint86.so.2.0.1 $pkgdir/usr/lib/iscan/
  install -m755 usr/lib/iscan/libesint86.so.2 $pkgdir/usr/lib/iscan/
  install -m755 usr/lib/iscan/libesint86.so $pkgdir/usr/lib/iscan/
  install -d $pkgdir/usr/share/iscan
  install -m644 usr/share/iscan/esfw86.bin $pkgdir/usr/share/iscan
  install -d $pkgdir/usr/share/licenses/$pkgname/
}
