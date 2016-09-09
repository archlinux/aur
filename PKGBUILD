# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.6.1
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
	"https://download.elasticsearch.org/kibana/kibana/$pkgname-$pkgver-linux-x86_64.tar.gz"
	kibana.service)
sha256sums=('2cc005b7bfbe2436f4cf93fcdb957ab5683e7d7843537dfd2bd51644c835dcaf'
			'SKIP')

package() {
	cd "$pkgdir"

	install -dm755 usr/lib/kibana
	install -Dm644 "$srcdir/kibana.service" usr/lib/systemd/system/kibana.service

	cd "$srcdir/$pkgname-$pkgver-linux-x86_64"

	install -Dm644 config/kibana.yml "$pkgdir"/etc/elasticsearch/kibana/kibana.yml

	rm -R ./node/
	chmod o+w optimize/
	cp -Rp * "$pkgdir"/usr/lib/kibana/
}
