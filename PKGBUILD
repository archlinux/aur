# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname="sabiql"
pkgver=3.0.2
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
sha512sums=('5e10e4bd74b39b8ab6d46266d5fe84a12e6a04c9500137a24db563b2574efb1ac6c9b8e18ff3b747a49c4d50c3461306a6ca1c319c41584a1c1e2486c0bbaaa1')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
