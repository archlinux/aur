# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>

pkgname=wmpiki
pkgver=0.2.4
pkgrel=3
pkgdesc="Multiping host checker dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20121031045821/http://dockapps.windowmaker.org/file.php/id/120"
license=('GPL-1.0-only')
depends=('libxpm')
options+=('!debug')
source=("$pkgname-$pkgver.tar.gz"
	"$pkgname.patch"
    "docklib.patch")
md5sums=('119c87de9c0f2aa2e496a9797b1e9055'
         'c5baaca900e6f9ccc361611d510032c2'
        '88c1a7607f976db80e5f9bec3c8b8a73')


prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np2 -b -z .orig -i "$srcdir/$pkgname.patch"
    patch -Np2 -b -z .orig -i "$srcdir/docklib.patch" "src/docklib.h"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -m644 AUTHORS ChangeLog README COPYING "$pkgdir/usr/share/doc/$pkgname"
}
