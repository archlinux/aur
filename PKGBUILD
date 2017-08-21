pkgname=svd2rust-git
_pkgname=svd2rust
pkgdesc="Generate Rust register maps (structs) from SVD files"
pkgrel=1
pkgver=0.11.3.204
arch=('i686' 'x86_64')
conflicts=("svd2rust")
provides=("svd2rust")
url="https://github.com/japaric/svd2rust"
license=('Apache' 'MIT')
depends=()
makedepends=('rust' 'cargo')
optdepends=()
source=("$_pkgname::git+https://github.com/japaric/svd2rust")
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
	install -D -m755 "$srcdir/$_pkgname/target/release/svd2rust" "$pkgdir/usr/bin/svd2rust"
}
