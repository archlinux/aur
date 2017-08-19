# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=dav
pkgver=0.8.6
pkgrel=1
pkgdesc="An ncurses-based console text editor"
arch=('i686' 'x86_64')
url="http://dav-text.sourceforge.net"
license=('GPL2')
depends=('ncurses')
#source=("${url}/files/${pkgname}-${pkgver}.tar.gz")
source=("https://gitlab.com/atsb/dav-text/repository/$pkgname-text-$pkgver/archive.tar.gz")
md5sums=('c352004d0552210e93d569dfd49d34df')
sha1sums=('a1e3e5b1b34f7706561ac0503db7bae9cdd4fa7c')
sha256sums=('d9ac3991621c0799e813277b87e0a9e666c92041c1e257c9b351a8db62956ee8')

prepare() {
  cd $srcdir/$pkgname*
  # fix for env LDFLAGS
  sed -i '/^LDFLAGS/d' Makefile
  sed -i 's/$(CC)/$(CC) -lncurses/' Makefile
  # remove executable bits from man page
  chmod -x dav.1.gz
}

build() {
  cd $srcdir/$pkgname*
  make
}

package() {
  cd $srcdir/$pkgname*
  make prefix="$pkgdir/usr" install
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

