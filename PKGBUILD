# Maintainer: Dante Helmore <frostu8@protonmail.com>
pkgname=wasm-pack-git
_pkgname=wasm-pack
pkgdesc="Your favorite rust -> wasm workflow tool!"
pkgrel=1
pkgver=0.9.1.967
arch=('i686' 'x86_64')
conflicts=("wasm-pack")
provides=("wasm-pack")
url="https://github.com/ashleygwilliams/wasm-pack"
license=('Apache' 'MIT')
depends=('rust' 'cargo' 'wasm-bindgen' 'npm')
makedepends=('git')
source=("$_pkgname::git+https://github.com/rustwasm/wasm-pack")
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
	install -D -m755 "$srcdir/$_pkgname/target/release/wasm-pack" "$pkgdir/usr/bin/wasm-pack"
}
