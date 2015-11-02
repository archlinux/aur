# Maintainer: Anthony C <kurodroid.1@gmail.com>
# Contributor: Michael P <ptchinster@archlinux.us>

pkgname=honeyd
pkgver=1.5c
pkgrel=5
pkgdesc="A small daemon that creates virtual hosts on a network."
depends=('libdnet' ' libevent' 'libpcap')
source=(http://www.honeyd.org/uploads/$pkgname-$pkgver.tar.gz)
md5sums=('9887b44333e380a2205f64fa245cb727')
arch=(i686 x86_64 arm)
url="http://www.honeyd.org"
license=("GPL")

build()
{
	cd $srcdir/$pkgname-$pkgver
  	mkdir -p $pkgdir/usr/share/honeyd
}

package()
{
	./configure --prefix=/usr
	make || return 1
	make prefix=$pkgdir/usr install
}

permissions()
{
	# Fix permissions on webserver dirs
	for dir in webserver webserver/htdocs webserver/htdocs/graphs \
	webserver/htdocs/images webserver/htdocs/styles webserver/htdocs/templates \
	webserver/htdocs/templates/inc
		do chmod 755 $pkgdir/usr/share/honeyd/$dir
	done
}
