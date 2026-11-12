# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname="sabiql"
pkgver=3.0.3
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
sha512sums=('603ac4e24a7449291d624dae8f2700188d384e54947ed2b9c5301ecd69aa0b1ef2c786d91340e1b30cc3d106cc127706ad7bb8ab75126d7a2768d7f700450d58')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
