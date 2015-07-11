# Contributor: koneu
# Contributor: Thomas Dziedzic

pkgname=usermode
pkgver=1.111
pkgrel=4
pkgdesc="Allow configured programs to be run with superuser privileges by ordinary users"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/$pkgname/"
license=('GPL2')
depends=('gtk2' 'libice' 'libsm' 'libuser' 'startup-notification')
makedepends=('desktop-file-utils' 'intltool')
source=("https://fedorahosted.org/releases/u/s/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('28ba510fbd8da9f4e86e57d6c31cff29')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr      \
	            --sbindir=/usr/bin \
	            --sysconfdir=/etc
	make
}

package() {
	cd "$pkgname-$pkgver"

	make "DESTDIR=$pkgdir/" install

	chmod 04711 "$pkgdir"/usr/bin/userhelper
}

# vim: set ft=sh ts=4 sw=4 noet:
