pkgname=mmucl
pkgver=1.5.2
pkgrel=1
pkgdesc="MUD client programmed in tcl."
arch=('i686' 'x86_64')
depends=('tcl')
license=('GPL2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
	mmucl.install)
url="http://mmucl.sourceforge.net/"
md5sums=('d38ad0b1a51325dada8ac6b1b15113e2'
         '1b6e24eb94357959362faf41f8e0edd1')
install=mmucl.install

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/share/mmucl
  sed -i "s|/usr/local|$startdir/pkg/usr|" Makefile
  grep -v "/mmucl.info" Makefile &> Makefile2
  mv Makefile2 Makefile
  make || return 1
  make install || return 1
  install -Dm644 $startdir/src/$pkgname-$pkgver/mmucl.html $startdir/pkg/usr/share/mmucl/ || return 1
  sed -i "s|$startdir/pkg||" $startdir/pkg/usr/bin/mmucl2
}
