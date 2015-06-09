# Maintainer: Spider.007 <aur@spider007.net>
# Don't forget updating the version @ *.service
pkgname=graylog-web-interface
replaces=graylog2-web-interface
pkgver=1.1.0
pkgrel=1
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
backup=(etc/webapps/$pkgname/$pkgname.conf)
options=(!strip)
sha256sums=('d7aaa73f7513dc42c24e6a3ecae4e5ed7e5e738f1886bf1a92789b7c71b2e3de'
            'SKIP'
            'SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 "$srcdir/graylog-web-interface.conf" "$pkgdir/etc/conf.d/graylog-web-interface.conf"
	install -Dm644 "$srcdir/graylog-web-interface.service" "$pkgdir/usr/lib/systemd/system/graylog-web-interface.service"

	install -dm755 -o nobody "$pkgdir/etc/webapps/$pkgname/logs"
	cp conf/* "$pkgdir/etc/webapps/$pkgname/"

	install -dm755 "$pkgdir/usr/share/webapps/$pkgname"
	cp -R lib/ "$pkgdir/usr/share/webapps/$pkgname/"

	ln -s $pkgname.$pkgname-$pkgver.jar "$pkgdir/usr/share/webapps/$pkgname/lib/$pkgname.jar"
	ln -s /etc/webapps/$pkgname/ $pkgdir/usr/share/webapps/$pkgname/conf
}
