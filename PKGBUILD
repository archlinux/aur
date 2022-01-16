pkgname=wasm-bindgen-git
_pkgname=wasm-bindgen
pkgdesc="Interoperating JS and Rust code"
pkgrel=1
pkgver=0.2.78.3270
arch=('i686' 'x86_64')
conflicts=("wasm-bindgen")
provides=("wasm-bindgen")
url="https://github.com/rustwasm/wasm-bindgen"
license=('Apache' 'MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$_pkgname::git+https://github.com/rustwasm/wasm-bindgen.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname/crates/cli
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/wasm-bindgen" "$pkgdir/usr/bin/wasm-bindgen"
	install -D -m755 "$srcdir/$_pkgname/target/release/wasm-bindgen-test-runner" "$pkgdir/usr/bin/wasm-bindgen-test-runner"
	install -D -m755 "$srcdir/$_pkgname/target/release/wasm2es6js" "$pkgdir/usr/bin/wasm2es6js"
}
