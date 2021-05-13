#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xfwp
_pkgname=xfwp
pkgdesc="X firewall proxy"
pkgver=1.0.3
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libice')
makedepends=('xproxymngproto' 'xorg-util-macros' 'xorgproto')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('73512e16b04ed156d45124d4c75fa533')

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
