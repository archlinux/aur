pkgname=cargo-crev-git
_pkgname=crev
pkgdesc="Scalable, social, Code REView and recommendation system that we desperately need"
pkgrel=1
pkgver=0.3.0.386
arch=('i686' 'x86_64')
conflicts=("cargo-crev")
provides=("cargo-crev")
url="https://github.com/dpc/crev"
license=('MPL' 'Apache' 'MIT')
depends=('openssl')
makedepends=('rust' 'cargo' 'clang')
source=("$_pkgname::git+https://github.com/dpc/crev.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname/cargo-crev
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/cargo-crev" "$pkgdir/usr/bin/cargo-crev"
	install -D -m755 "$srcdir/$_pkgname/target/release/crev" "$pkgdir/usr/bin/crev"
	install -D -m755 "$srcdir/$_pkgname/target/release/crev" "$pkgdir/usr/bin/crevsum"
	install -D -m755 "$srcdir/$_pkgname/target/release/crev" "$pkgdir/usr/bin/rblake2sum"
}
