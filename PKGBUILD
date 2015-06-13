# Maintainer: Brendan MacDonell <macdonellba@gmail.com>
pkgname=rc
pkgver=1.7.2
pkgrel=1
pkgdesc="An alternative implementation of the plan 9 rc shell."
url="http://tobold.org/article/rc"
license=('custom')
arch=('i686' 'x86_64')
depends=('readline')
options=('strip')
source=(http://static.tobold.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ef8b4be56cee9a95558f538339dc96f1')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --datarootdir=/usr/share --with-edit=gnu
  make
  ./rc < trip.rc
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install --mode=755 -d $pkgdir/usr/share/licenses/$pkgname/
  install --mode=644 COPYING $pkgdir/usr/share/licenses/$pkgname/
}
