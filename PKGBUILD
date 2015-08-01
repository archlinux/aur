# Maintainer: Roel Gerrits <roel@roelgerrits.nl>
pkgname=nodm
pkgver=0.7
pkgrel=12
pkgdesc='X display manager for automatic logins'
arch=('i386' 'x86_64')
url='http://enricozini.org/sw/nodm/'
license=('GPL')
depends=(pam)
makedepends=()
optdepends=()
provides=()
options=()
backup=('etc/nodm.conf')

source=("http://enricozini.org/sw/nodm/$pkgname-$pkgver.tar.gz"
	"nodm.conf"
	"nodm.service"
	"norestart.patch")

md5sums=('6a569e9be7baf56de5c5813483d0357c'
         'e0ba34eb1fac0b2ec3fe73fcbb3b8f6a'
         'a93a5afdb4e68643840166796fa3a6a3'
         '5076b2fe19551c42e3f5cd8bf445927f')

build()
{
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr/

	make
}

package()
{
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 nodm $pkgdir/usr/bin/nodm
	install -Dm644 ../nodm.conf $pkgdir/etc/nodm.conf
	install -Dm644 ../nodm.service $pkgdir/usr/lib/systemd/system/nodm.service
}
