# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname="sabiql"
pkgver=1.9.0
pkgrel=1
pkgdesc="A fast, driver-less TUI to browse, query, and edit PostgreSQL databases"
arch=("x86_64")
url="https://github.com/riii111/sabiql"
license=('MIT')
depends=('postgresql-libs')
makedepends=('cargo')
optdepends=('graphviz: for ER diagrams')
options=(!lto)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('78d188a5c28471260123ae2ae4a391184c46141da23d76d030b5c2894f8bbbacee712faf99485b519b3331f810fbb5902bae38650f5c0290fd8189954d143cd0')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
