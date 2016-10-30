# Maintainer: Liqueur Librazy <im@librazy.org>
pkgname=tidb-bin
pkgver=0.0.1.20161030052309
pkgrel=1
pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
backup=()
options=()

source=("http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz"
	"http://download.pingcap.org/tidb-latest-linux-amd64.sha256")

sha256sums=(
	'SKIP'
	'SKIP')

pkgver() {
	cd "tidb-latest-linux-amd64"
	echo "0.0.1.$(./bin/tidb-server -v |grep 'Time:' | cut -c18-36| sed 's/[ :-]//g')"
}

prepare() {
	sha256sum -c tidb-latest-linux-amd64.sha256
}

package() {
	install -dm755 "$pkgdir"/{opt/tidb/conf,usr/bin}
	cd "tidb-latest-linux-amd64/bin"
	install -D -m755 *-server "${pkgdir}/usr/bin"
	cd ..
	cp -R conf "$pkgdir/opt/tidb/"
}
