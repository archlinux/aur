# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=connman-git
pkgver=1.28.48.gc89ffc1
pkgrel=1
pkgdesc="Wireless LAN network manager (git version)"
arch=('i686' 'x86_64')
url="https://01.org/connman"
license=('GPL2')
depends=('dbus' 'iptables' 'gnutls' 'glib2' 'wpa_supplicant' 'pptpclient')
makedepends=('git')
conflicts=('connman')
provides=('connman')
source=("git://git.kernel.org/pub/scm/network/connman/connman.git")
md5sums=('SKIP')

_gitroot="connman"

pkgver () {
	cd "$srcdir/$_gitroot"
	git describe --always | sed 's|-|.|g' 
}

build() {
	cd "$srcdir/$_gitroot"
	./bootstrap
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--with-systemdunitdir=/usr/lib/systemd/system \
		--enable-pptp \
		--enable-polkit \
		--enable-client
	make
}

package() {
	cd "$srcdir/$_gitroot"
	make DESTDIR="$pkgdir" install
}
