# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=pam-shield
pkgver=0.9.6
pkgrel=1
pkgdesc='PAM module to block remote hosts using iptables after too many failed authentication attempts'
arch=(i686 x86_64)
url='https://github.com/jtniehof/pam_shield'
license=(GPL)
depends=('pam' 'gdbm')
source=("pam_shield-$pkgver.tar.gz::https://github.com/jtniehof/pam_shield/archive/${pkgver}.tar.gz")
sha256sums=('9da0d423dcdcdeab392cfb7bc5bcd5833850ec46503b1f98e4cadd068720b907')

prepare() {
	cd "$srcdir/pam_shield-$pkgver"
	autoreconf -i
	./configure \
		--localstatedir=/var \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--with-slibdir=/usr/lib
}

build() {
	cd "$srcdir/pam_shield-$pkgver"
	make
}

package() {
	cd "$srcdir/pam_shield-$pkgver"
	make DESTDIR="$pkgdir" install
}
