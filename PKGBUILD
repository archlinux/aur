# Maintainer: teamalpha5441
pkgname=pam_radius
pkgver=2.0.0
pkgrel=1
pkgdesc="This is the FreeRADIUS PAM to RADIUS authentication module."
url="https://freeradius.org/sub_projects/"
depends=('pam')
makedepends=('git')
license=('GPL2')
arch=('x86_64')

source=("git://github.com/FreeRADIUS/pam_radius#tag=release_2_0_0")
sha256sums=('SKIP')

backup=('etc/raddb/server')

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -m 755 -D pam_radius_auth.so "$pkgdir/usr/lib/security/pam_radius_auth.so"
	install -m 600 -D pam_radius_auth.conf "$pkgdir/etc/raddb/server"
	chmod 700 "$pkgdir/etc/raddb"
}
