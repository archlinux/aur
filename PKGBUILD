# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=5.0.0
pkgrel=3
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
sha256sums=('39cf5bc9e249df7ef98f0b7883f4ff23514a40290dfc48c5101b1d1ab67d60ae'
            'SKIP')

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
