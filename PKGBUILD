# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=fi
_pkgname=f-irc
arch=('i686')
pkgver=1.36
pkgrel=1
pkgdesc="f-irc is an irc terminal client"
license=('unknown')
depends=('ncurses')
url="http://www.vanheusden.com/fi/"
source=("http://www.vanheusden.com/${_pkgname}/${pkgname}-${pkgver}.tgz")
md5sums=('195e3fe6ba32013888eb12a640016d37')

build() {
cd $srcdir/$pkgname-$pkgver
sed -i '/ln /s%.*%	ln -s /usr/bin/fi $(DESTDIR)/bin/f-irc%' Makefile
sed -i '/include/s%ncursesw/%%' *.c *.h
make
}

package() {
mkdir -p $pkgdir/{usr/{bin,share/man/man1},etc}
cd $srcdir/$pkgname-$pkgver
make DESTDIR=$pkgdir/usr SYSCONFDIR=$pkgdir/etc install
install -Dm644 firc.ignore $pkgdir/etc
#sed -i 's/ignore_file=firc.ignore/ignore_file=\/etc\/firc.ignore/' $pkgdir/etc/firc.conf
}
