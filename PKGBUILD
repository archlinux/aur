pkgname=rust-analyzer-git
pkgver=0.0.0.12704.g277488b51
pkgrel=1
epoch=1
pkgdesc="An experimental Rust compiler front-end for IDEs"
arch=('x86_64' 'i686')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
optdepends=()
provides=('rust-analyzer')
conflicts=('rust-analyzer')
source=($pkgname::git+https://github.com/rust-analyzer/rust-analyzer.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' crates/rust-analyzer/Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/rust-analyzer" "$pkgdir/usr/bin/rust-analyzer"
}
