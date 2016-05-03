# Maintainer: SanskritFritz (gmail)
# Contributor: Brian Bidulock <bidulock@openss7.org>
 
pkgname=wmgtemp
pkgver=1.1
pkgrel=4
pkgdesc="Dockapp to graphically display CPU and SYS temperatures."
url="http://fluxcode.net/projects/wmgtemp"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxpm' 'lm_sensors')
source=("http://fluxcode.net/files/wmgtemp-1.1.tar.gz"
	inline.patch)
md5sums=('cce700b3a4ef74b2ec019d8e89bdf2f6'
         'e9607a7259316854834b3ed4073697b7')
 
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -b -z .orig -i ../inline.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "/MANINSTDIR=/d" Makefile
  make PREFIX="/usr"
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  make INSTDIR="$pkgdir/usr/bin" MANINSTDIR="$pkgdir/usr/share/man/man1" install
}

