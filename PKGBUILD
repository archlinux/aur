# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="sqlx-cli"
pkgname="$_crate"
pkgver=0.5.2
pkgrel=1
pkgdesc='Command-line utility for SQLx, the Rust SQL toolkit.'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://github.com/launchbadge/sqlx"
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('e8030c856872a4c48b793a72debb4214d94c7af3a076ed5aa4a3df6319715f4bc2eb1ec8887ece0e61bd683c2a274d8c5a6d55cd0898d61881835c9d5608c3f4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-sqlx" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/sqlx" -t "$pkgdir/usr/bin"
}
