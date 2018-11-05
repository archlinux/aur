# Contributor: koneu
# Contributor: Thomas Dziedzic

pkgname=usermode
pkgver=1.113
pkgrel=1
pkgdesc="Allow configured programs to be run with superuser privileges by ordinary users"
arch=('i686' 'x86_64')
url="https://pagure.io/$pkgname"
license=('GPL2')
depends=('gtk2' 'libice' 'libsm' 'libuser' 'pam' 'startup-notification')
makedepends=('desktop-file-utils' 'intltool')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('eadfbff18578b645096b6fa61854b41d')

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
