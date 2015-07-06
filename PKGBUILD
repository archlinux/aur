# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=dav
pkgver=0.8.5
pkgrel=3
pkgdesc="An ncurses-based console text editor"
arch=('i686' 'x86_64')
url="http://dav-text.sourceforge.net"
license=('GPL2')
depends=('ncurses')
source=("${url}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('992ddc8a72b2840bdbaaeb243d2b32c3')
sha1sums=('ec43ac1314ea740e909f149203845d5071084d76')
sha256sums=('af3835c31f7fb28815bc9b5fcc76e229d0e389d13b178858d120664af486a9ba')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  # fix for env LDFLAGS
  sed -i '/^LDFLAGS/d' Makefile
  sed -i 's/$(CC)/$(CC) -lncurses/' Makefile
  # remove executable bits from man page
  chmod -x dav.1.gz
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -e
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

