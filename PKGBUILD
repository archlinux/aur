pkgname=cargo-xbuild-git
_pkgname=cargo-xbuild
pkgdesc="Automatically cross-compiles the sysroot crates core, compiler_builtins, and alloc."
pkgrel=1
pkgver=0.4.2.287
arch=('i686' 'x86_64')
conflicts=("cargo-xbuild")
provides=("cargo-xbuild")
url="https://github.com/rust-osdev/cargo-xbuild"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
optdepends=('rust-src: rust std source code')
source=("$_pkgname::git+https://github.com/rust-osdev/cargo-xbuild")
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
	install -D -m755 "$srcdir/$_pkgname/target/release/cargo-xbuild" "$pkgdir/usr/bin/cargo-xbuild"
}
