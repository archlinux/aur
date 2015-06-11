#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-grandr
_pkgname=grandr
pkgdesc="Friendly interface to monitor configuration"
pkgver=0.1
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('gconf' 'glib')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2"
	'xlib_dep.patch')
md5sums=('e265c8e89aab39c55cb24ad8230c3933'
         '0a272a3f108a1c646838178610ef998b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p0 -i "$srcdir/xlib_dep.patch"
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc \
	--mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
