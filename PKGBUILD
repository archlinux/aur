# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname="sabiql"
pkgver=1.11.1
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
sha512sums=('a51d33abd3563bcfe18939b2b525da00341beb768e34fc222a35ee9138899f66b59b79c9dee4b64450a2a2b4ab7b89425a13f0b75f6209f79b4a23bca0a08786')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
