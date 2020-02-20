pkgname=rust-analyzer-git
pkgver=0.1.0.7807.g4e288c64f
pkgrel=1
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
