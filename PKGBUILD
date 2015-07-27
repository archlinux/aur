# Contributors: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
# Maintainer:              Milan HrabÃ¡nek <hrabi@linuxwaves.com>

pkgname=pypoker-eval
pkgver=138.0
pkgrel=4
pkgdesc="python adaptor for the poker-eval toolkit"
arch=('i686' 'x86_64')
url="http://pokersource.sourceforge.net/"
license=(GPL)
depends=(poker-eval python2)
source=("http://download.gna.org/pokersource/sources/${pkgname}-${pkgver}.tar.gz" "632234.patch")
md5sums=('751cad1e5c18c7c2f36a086a937193aa'
         '5ab7bf686ea3d6181870a438a311954d')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../632234.patch

  automake --add-missing --copy || echo "automake exit status: $?"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
