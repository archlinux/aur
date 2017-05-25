# Maintainer: Liqueur Librazy <im@librazy.org>
pkgname=tidb-bin-nightly
pkgver=0.0.1.20170524020718
pkgrel=1

pkgdesc="A distributed NewSQL database compatible with MySQL protocol"
arch=('x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('gcc-libs')
conflict=('tidb-bin')
backup=()
options=()
_nametoday="${pkgname}-$(date +%FT%H)"
source=("${_nametoday}.sha256::http://download.pingcap.org/tidb-latest-linux-amd64.sha256"
	"${_nametoday}.tar.gz::http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz")

sha256sums=(
	'SKIP'
	'SKIP')

pkgver() {
	cd "tidb-latest-linux-amd64"
	echo "0.0.1.$(./bin/tidb-server -V |grep 'Time:' | cut -c18-36| sed 's/[ :-]//g')"
}

prepare() {
	cp "${_nametoday}.tar.gz" "tidb-latest-linux-amd64.tar.gz"
	sha256sum -c ${_nametoday}.sha256
}

package() {
	install -dm755 "$pkgdir"/{opt/tidb/conf,usr/bin}
	cd "tidb-latest-linux-amd64/bin"
	install -D -m755 *-server "${pkgdir}/usr/bin"
	cd ..
}
