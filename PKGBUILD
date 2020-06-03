# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-geiger
pkgver=0.10.1
pkgrel=1
pkgdesc="Detects usage of unsafe Rust in a Rust crate and its dependencies"
arch=('x86_64' 'x86')
url="https://crates.io/crates/cargo-geiger"
license=('MIT' 'Apache')
depends=('openssl' 'curl')
makedepends=('cargo' 'git')
# No proper tags available for most releases, so commit hashes it is.
source=("$pkgname::git+https://github.com/rust-secure-code/cargo-geiger.git#commit=dc5ef77d70038d72e979b32a2a8b3207afaa2d22")
sha256sums=('SKIP')


build() {
	cd "$pkgname"
	cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -Dt "$pkgdir/usr/bin" -m755 target/release/cargo-geiger
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" cargo-geiger/LICENSE-*
}
