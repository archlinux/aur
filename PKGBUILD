# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=dbdiff
pkgver=0.2.2
pkgrel=1
_repo=dbdiff
_tag=v0.2.2
_srcdir="$_repo-$pkgver"
pkgdesc="Compare database schemas, detect schema drift, and generate migration SQL, with JSON output and a CI mode"
arch=('x86_64')
url="https://github.com/rekurt/dbdiff.git"
license=('MIT')
depends=('gcc-libs' 'openssl')
optdepends=('postgresql: comparación contra bases PostgreSQL' 'mysql: comparación contra bases MySQL')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rekurt/dbdiff/archive/refs/tags/$_tag.tar.gz")
sha256sums=('85a3f04a36b7832ff9a48fd064f5a7c1d0dc6005ee64594ba76bb6251f68f537')

build() {
	cd "$_srcdir"
	cargo build --release --locked
}

check() {
	cd "$_srcdir"
	cargo test --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 target/release/dbdiff "$pkgdir/usr/bin/dbdiff"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
