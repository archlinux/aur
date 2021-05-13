#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xfindproxy
_pkgname=xfindproxy
pkgdesc="Locate X proxy services"
pkgver=1.0.3
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxt')
makedepends=('xproxymngproto' 'xorg-util-macros' 'xorgproto')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('88bf1e959865a3c5f31ea8efc9fe9e37')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
	--mandir=/usr/share/man \
	--disable-selective-werror
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
