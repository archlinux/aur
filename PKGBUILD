pkgname=icinga-classic-ui
pkgver=1.12.0
pkgrel=1
pkgdesc="Icinga Classic UI Standalone."
license=('GPL')
arch=('i686' 'x86_64')
depends=('icinga2' 'fcgiwrap')
url="http://www.icinga.org"
source=("https://github.com/Icinga/icinga-core/releases/download/v${pkgver}/icinga-${pkgver}.tar.gz")

build() {
  cd "$srcdir/icinga-$pkgver"

	./configure \
		--enable-classicui-standalone \
		--with-web-user=http --with-web-group=http \
		--prefix=/usr/share/icinga-classic-ui \
		--with-htmurl=/ --with-cgiurl=/cgi-bin \
		--enable-cgi-log --with-cgi-log-dir=/var/log/icinga/ \
		--with-http-auth-file=/etc/icinga2/users \
		--with-command-group=http --sysconfdir=/etc/icinga2
}

package() {
	cd "$srcdir/icinga-$pkgver"

	make DESTDIR="$pkgdir" classicui-standalone
	make DESTDIR="$pkgdir" install-classicui-standalone install-classicui-standalone-conf
}

md5sums=('0d7919057455a548d43b888dfa7d0cdb')
