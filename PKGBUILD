# Maintainer: mms <saboorian@gmail.com>

pkgname=zekr
pkgver=1.1.0
pkgrel=2
pkgdesc="An open Quranic platform aimed to ease access to the Holy Quran for reading, \
	translating, or researching."
url="http://zekr.org/quran/quran-for-linux"
license=("GPL")
arch=('i686' 'x86_64')
depends=('java-runtime' 'libwebkit')
#optdepends=('flashplugin: Enable Audio Recitations') #Apparently not needed anymore
# Sources abd nd5sums for i686
[ "$CARCH" = "i686" ] && source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-linux.tar.gz $pkgname.desktop)
[ "$CARCH" = "i686" ] && md5sums=('a6e7178d9ce2ccbe04c8b1b3acd64d01' 'c82122b0b8766412fc152dd7cb5f176e')
# Sources and md5sums for x86_64
[ "$CARCH" = "x86_64" ] && source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-linux_64.tar.gz $pkgname.desktop)
[ "$CARCH" = "x86_64" ] && md5sums=('33b16a90cad76c6cf3dbea83e9fb1fe7' 'c82122b0b8766412fc152dd7cb5f176e')

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr/share/java/$pkgname
  cp -r $srcdir/$pkgname $pkgdir/usr/share/java/
  sed -i 's|DIR_NAME=`dirname $0`|DIR_NAME=/usr/share/java/zekr|' $srcdir/$pkgname/zekr.sh
  rm $pkgdir/usr/share/java/zekr/zekr.sh
  install -D -m755 $srcdir/$pkgname/zekr.sh $pkgdir/usr/bin/$pkgname.sh
  mkdir -p $pkgdir/usr/share/pixmaps
  install -D -m644 $srcdir/$pkgname/res/image/icon/open-book-128.png $pkgdir/usr/share/pixmaps/$pkgname.png
  mkdir -p $pkgdir/usr/share/applications
  install -D -m755 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
