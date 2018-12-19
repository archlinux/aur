pkgname=rust-analyzer-git
pkgver=0.1.0.1249.g0e1c01c
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs"
arch=('x86_64' 'i686')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=()
provides=('rust-analyzer')
conflicts=('rust-analyzer')
source=($pkgname::git+https://github.com/rust-analyzer/rust-analyzer.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' crates/ra_lsp_server/Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/ra_lsp_server" "$pkgdir/usr/bin/ra_lsp_server"
	install -D -m755 "$srcdir/$pkgname/target/release/ra_cli" "$pkgdir/usr/bin/ra_cli"
}
