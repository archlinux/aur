# Maintainer: Spider.007 <aur@spider007.net>
pkgname=graylog-web-interface
replaces=graylog2-web-interface
pkgver=1.1.2
pkgrel=2
pkgdesc="Web interface for Graylog, an open source syslog implementation"
arch=(any)
url="http://graylog.org"
license=('GPL')
depends=(java-runtime)
source=(
	https://packages.graylog2.org/releases/$replaces/$pkgname-$pkgver.tgz
	graylog-web-interface.service
	graylog-web-interface.conf
)
backup=(etc/graylog/web-interface/graylog-web-interface.conf)
options=(!strip)
sha256sums=('2d1e414f0b4928f5ba866f89652db0f0995496ffd6bd178ee0d8458e4abd89eb'
			'SKIP'
			'SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 "$srcdir/graylog-web-interface.conf" "$pkgdir/etc/conf.d/graylog-web-interface.conf"
	install -Dm644 "$srcdir/graylog-web-interface.service" "$pkgdir/usr/lib/systemd/system/graylog-web-interface.service"

	mkdir -p $pkgdir/{usr/lib/$pkgname,etc/graylog/web-interface}

	install -Dm644 lib/*  "$pkgdir/usr/lib/$pkgname/"
	install -Dm644 conf/* "$pkgdir/etc/graylog/web-interface/"
	install -dm755 -o nobody "$pkgdir/var/log/$pkgname/"

	ln -s $pkgname.$pkgname-$pkgver.jar "$pkgdir/usr/lib/$pkgname/$pkgname.jar"
	ln -s /etc/graylog/web-interface/ $pkgdir/usr/lib/$pkgname/conf
	ln -s /var/log/graylog-web-interface/ $pkgdir/usr/lib/$pkgname/logs
}
