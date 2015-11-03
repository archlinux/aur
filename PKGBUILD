# Maintainer: Anthony C <kurodroid.1@gmail.com>
# Contributor: Michael P <ptchinster@archlinux.us>

pkgname=honeyd
pkgver=1.5c
pkgrel=5
pkgdesc="A small daemon that creates virtual hosts on a network."
depends=('libdnet' 'libevent' 'libpcap')
source=(http://www.honeyd.org/uploads/$pkgname-$pkgver.tar.gz)
md5sums=('9887b44333e380a2205f64fa245cb727')
arch=(i686 x86_64 arm)
url="http://www.honeyd.org"
license=("GPL")

build()
{
	cd "$srcdir/$pkgname-$pkgver"
  	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package()
{
	mkdir -p $pkgdir/usr/share/honeyd

	cd "$srcdir/$pkgname-$pkgver"
	#make prefix=$pkgdir/usr install
	make DESTDIR="$pkgdir/usr" install

	# Fix permissions on webserver dirs
	for dir in webserver webserver/htdocs webserver/htdocs/graphs \
	webserver/htdocs/images webserver/htdocs/styles webserver/htdocs/templates \
	webserver/htdocs/templates/inc
		do chmod 755 $pkgdir/usr/share/honeyd/$dir
	done
}
