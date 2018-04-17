pkgname=seer-git
_pkgname=seer
pkgdesc="symbolic execution engine for Rust"
pkgrel=1
pkgver=0.0.3.327
arch=('i686' 'x86_64')
conflicts=("seer")
provides=("seer")
url="https://github.com/dwrensha/seer"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
source=("$_pkgname::git+https://github.com/dwrensha/seer")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/seer" "$pkgdir/usr/bin/seer"
	install -D -m755 "$srcdir/$_pkgname/target/release/cargo-seer" "$pkgdir/usr/bin/cargo-seer"
}
