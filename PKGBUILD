# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=5.3.0
pkgrel=1
pkgdesc="browser based analytics and search dashboard for Elasticsearch. Please note; this package replaces the distributed precompiled binary 'node'"
arch=('any')
url="https://www.elastic.co/products/kibana"
license=('apache')
depends=('nodejs')
optdepends=('elasticsearch>=2.4')
backup=('etc/elasticsearch/kibana/kibana.yml')
options=('!strip')
source=(
	"https://artifacts.elastic.co/downloads/$pkgname/$pkgname-$pkgver-linux-x86_64.tar.gz"
	kibana.service)
sha256sums=('f31369c32d655370f0e51290018004cfbc54e2d648f0f79dba88e36b4d6cce6f'
            'SKIP')

package() {
	cd "$pkgdir"

	install -dm755 usr/share/kibana
	install -Dm644 "$srcdir/kibana.service" usr/lib/systemd/system/kibana.service
	install -Dm644 "$srcdir"/$pkgname-$pkgver-linux-x86_64/config/kibana.yml etc/elasticsearch/kibana/kibana.yml

	rm -R "$srcdir"/$pkgname-$pkgver-linux-x86_64/node/
	cp -Rp "$srcdir"/$pkgname-$pkgver-linux-x86_64/* usr/share/kibana
	chmod -R g+w,o+w usr/share/kibana/{optimize,data}/
}
