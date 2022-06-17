# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=dbgate-bin
pkgver=5.0.5
pkgrel=1
pkgdesc='Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others'
arch=('x86_64')
url="https://github.com/${pkgname%-bin}/${pkgname%-bin}"
license=('MIT')
depends=(
	nss
	gtk3
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install=dbgate.install
source=(
	"$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/dbgate-$pkgver-linux_amd64.deb"
	"$pkgname-$pkgver-LICENSE::${url/github/raw.githubusercontent}/v$pkgver/LICENSE"
)

b2sums=('d3e6e3d36834db145925cc1e0f4cbc8eb20d83cfd34a136388ae2db5d34c2179261bd7dd96ff3238c1334afa88e612c295c1c9ee121fd053f2b476bb8097b0d0'
        '9cc4e2813f0978862b0960aa0c8d5b0bc75ae299f10b793ae152202f2e6f43127381c9153c6f51ca1bc83ab633d198dac5d817105a8e7b43e1aad401e0b6eb2f')

package() {
	bsdtar -xf data.tar.xz --directory="$pkgdir"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir"/usr/bin
	ln -s /opt/DbGate/dbgate "$pkgdir"/usr/bin/dbgate
}
