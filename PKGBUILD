# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>
pkgname=wmbattery
pkgver=2.41
pkgrel=1
pkgdesc="Battery monitor dockapp for Window Maker"
arch=(i686 x86_64)
url="http://kitenet.net/~joey/code/wmbattery/"
license=('GPL')
depends=(libxpm hal)
source=(git://git.kitenet.net/wmbattery#tag=2.41
	disable-apm.patch)
md5sums=('SKIP'
         'c5e2a979ade6d16069065c93f2cf2402')

build() {
  cd "$srcdir/$pkgname"
  patch -p1 <../disable-apm.patch || return 1
  autoreconf -fiv || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
