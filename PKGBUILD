pkgname=rustfmt-nightly-git
_pkgname=rustfmt-nightly
pkgdesc="Format Rust code"
pkgrel=1
pkgver=0.99.6.4082
arch=('i686' 'x86_64')
conflicts=("rustfmt")
provides=("rustfmt")
url="https://github.com/rust-lang-nursery/rustfmt"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
source=("$_pkgname::git+https://github.com/rust-lang-nursery/rustfmt")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/rustfmt" "$pkgdir/usr/bin/rustfmt"
	install -D -m755 "$srcdir/$_pkgname/target/release/cargo-fmt" "$pkgdir/usr/bin/cargo-fmt"
	install -D -m755 "$srcdir/$_pkgname/target/release/rustfmt-format-diff" "$pkgdir/usr/bin/rustfmt-format-diff"
	install -D -m755 "$srcdir/$_pkgname/target/release/git-rustfmt" "$pkgdir/usr/bin/git-rustfmt"
}
