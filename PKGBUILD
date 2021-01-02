pkgname=cross-git
_pkgname=cross
pkgdesc="'Zero setup' cross compilation and 'cross testing' of Rust crates"
pkgrel=1
pkgver=0.2.1.644
arch=('i686' 'x86_64')
conflicts=("cross")
provides=("cross")
url="https://github.com/rust-embedded/cross"
license=('Apache' 'MIT')
depends=('rustup' 'cargo')
makedepends=('rust' 'cargo' 'git')
optdepends=(
	'rust-src: rust std source code'
	'docker: provide container'
	'podman: provide container'
)
source=("$_pkgname::git+https://github.com/rust-embedded/cross")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/cross" "$pkgdir/usr/bin/cross"
}
