# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=migrant
pkgver=0.14.0
pkgrel=1
pkgdesc="Basic database migration manager powered by migrant_lib"
arch=('x86_64')
url="https://github.com/jaemk/migrant"
license=('MIT')

# Uses native rust implementations of DB APIs
depends=()

makedepends=('cargo' 'git')
source=("git+https://github.com/jaemk/migrant#commit=846bfd7a5e2e52df92ce619246d4a1331ec5d515")
md5sums=('SKIP') # No checksums, git source

prepare() {
	cd "$pkgname"
	cargo fetch --locked
}

build() {
	cd "$pkgname"
	cargo build --locked --offline --release --features "postgres sqlite mysql"
}

# No tests included, so no check step
# check() {
# 	cd "$pkgname"
# 	cargo test
# }

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" target/release/migrant
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
