# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.1.1
pkgrel=1
pkgdesc="browser based analytics and search dashboard for Elasticsearch. Please note; this package replaces the distributed precompiled binary 'node'"
arch=('i686' 'x86_64')
url="http://www.elasticsearch.org/overview/kibana/"
license=('apache')
makedepends=('git')
depends=('nodejs')
backup=('etc/elasticsearch/kibana/kibana.yml')
install=kibana.install
source=(
	"https://download.elasticsearch.org/kibana/kibana/$pkgname-$pkgver-linux-x64.tar.gz"
	kibana.service)
[[ $CARCH == 'i686' ]] && ${source[0]}=${source[1]/x64/x86}
md5sums=('3a9bba5bb5e883851904fde9b79c291f'
         'SKIP')

package() {
	cd "$srcdir/`basename ${source[0]%.tar.gz}`"

	mkdir -p $pkgdir/usr/lib/kibana/
	install -Dm644 "$srcdir/kibana.service" "$pkgdir/usr/lib/systemd/system/kibana.service"
	install -Dm644 "config/kibana.yml" "$pkgdir/etc/elasticsearch/kibana/kibana.yml"
	cp -Rp ./src/* "$pkgdir/usr/lib/kibana/"
}
