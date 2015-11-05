# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.2.0
pkgrel=1
pkgdesc="browser based analytics and search dashboard for Elasticsearch. Please note; this package replaces the distributed precompiled binary 'node'"
arch=('i686' 'x86_64')
url="http://www.elasticsearch.org/overview/kibana/"
license=('apache')
depends=('nodejs')
optdepends=('elasticsearch>=2.0')
backup=('etc/elasticsearch/kibana/kibana.yml')
install=kibana.install
source=(
	"https://download.elasticsearch.org/kibana/kibana/$pkgname-$pkgver-linux-x64.tar.gz"
	kibana.service)
sha256sums=('67d586e43a35652adeb6780eaa785d3d785ce60cc74fbf3b6a9a53b753c8f985'
			'SKIP')

package() {
	cd "$srcdir/`basename ${source[0]%.tar.gz}`"

	mkdir -p $pkgdir/usr/lib/kibana/
	install -Dm644 "$srcdir/kibana.service" "$pkgdir/usr/lib/systemd/system/kibana.service"
	install -Dm644 "config/kibana.yml" "$pkgdir/etc/elasticsearch/kibana/kibana.yml"

	rm -R ./node/
	chmod +r -R src/
	find src -type d -exec chmod +x {} \;
	cp -Rp * "$pkgdir/usr/lib/kibana/"
}
