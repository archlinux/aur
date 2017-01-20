# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=5.1.2
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
sha256sums=('c2e30b9581e7222e8f2536d4b08087dc282a6b31a24ec0e43b905507fe2f2b04'
            '610c50d38ff0d4cff308b2ff2f38ce3012bf70e396aa25a9b85b821ad3675e3b')

package() {
	cd "$pkgdir"

	install -dm755 usr/share/kibana
	install -Dm644 "$srcdir/kibana.service" usr/lib/systemd/system/kibana.service

	cd "$srcdir/$pkgname-$pkgver-linux-x86_64"

	install -Dm644 config/kibana.yml "$pkgdir"/etc/elasticsearch/kibana/kibana.yml

	rm -R ./node/
	chmod o+w optimize/
	cp -Rp * "$pkgdir"/usr/share/kibana/
}
