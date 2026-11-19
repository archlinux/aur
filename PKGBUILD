# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname="sabiql"
pkgver=3.1.0
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
sha512sums=('f4412005f1333586600ca550985d34e4333aff81b6fbd8043e5abdcf609e161da2a834a2b77b469c7e977911d4148ef75e70004c0379b42236175ea8b87a070a')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
