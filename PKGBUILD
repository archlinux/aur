# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.6.0
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
sha256sums=('9c6520727e565607bb17c7147591a1328b9de39aa63067e9196ef78cd4f0a3d5'
			'SKIP')

package() {
	cd "$pkgdir"

	install -dm755 usr/lib/kibana

	install -Dm644 "$srcdir/kibana.service" usr/lib/systemd/system/kibana.service

	cd "$srcdir/$pkgname-$pkgver-linux-x86_64"

	install -Dm644 config/kibana.yml "$pkgdir"/etc/elasticsearch/kibana/kibana.yml

	rm -R ./node/
#	chmod +r -R src/; find src -type d -exec chmod +x {} \;
	cp -Rp * "$pkgdir"/usr/lib/kibana/

	chmod o+w "$pkgdir"/usr/lib/kibana/optimize/
}
