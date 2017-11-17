pkgname=cross-git
_pkgname=cross
pkgdesc="'Zero setup' cross compilation and 'cross testing' of Rust crates"
pkgrel=1
pkgver=0.1.14.235
arch=('i686' 'x86_64')
conflicts=("cross")
provides=("cross")
url="https://github.com/japaric/cross"
license=('Apache' 'MIT')
depends=('rust' 'cargo' 'docker')
makedepends=('rust' 'cargo')
optdepends=('rust-src: rust std source code')
source=("$_pkgname::git+https://github.com/japaric/cross")
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
	install -D -m755 "$srcdir/$_pkgname/target/release/cross" "$pkgdir/usr/bin/cross"
}
